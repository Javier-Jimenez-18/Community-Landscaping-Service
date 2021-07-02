class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  layout 'student_layout'

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    # create Method with Error Handling:
    # If @student.save return non-nil values, that means they succeeded,
    # and we can redirect back to the show page with a success message.
    # If they return nil, we have the else processing:
    # First collect the error and put it in the flash.now.alert
    # Then do the render, which basically means put the previous screen back up.
    @student = Student.new(student_params)
    if @student.save
      flash.notice = "The student record was created successfully."
      redirect_to @student
    else
      flash.now.alert = @student.errors.full_messages.to_sentence
      render :new
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    # update Method with Error Processing
    # If @student.update return non-nil values, that means they succeeded,
    # and we can redirect back to the show page with a success message.
    # If they return nil, we have the else processing:
    # First collect the error and put it in the flash.now.alert
    # Then do the render, which basically means put the previous screen back up.
    if @student.update(student_params)
      flash.notice = "The student record was updated successfully."
      redirect_to @student
    else
      flash.now.alert = @student.errors.full_messages.to_sentence
      render :edit
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to students_path
    end
  end
