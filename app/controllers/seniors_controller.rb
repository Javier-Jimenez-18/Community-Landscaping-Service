class SeniorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_senior, only: [:show, :edit, :update, :destroy]
  layout 'senior_layout'

  # GET /seniors
  # GET /seniors.json
  def index
    @seniors = Senior.all
  end

  # GET /seniors/1
  # GET /seniors/1.json
  def show
  end

  # GET /seniors/new
  def new
    @senior = Senior.new
  end

  # GET /seniors/1/edit
  def edit
  end

  # POST /seniors
  # POST /seniors.json
  def create
    # create Method with Error Handling:
    # If @senior.save return non-nil values, that means they succeeded,
    # and we can redirect back to the show page with a success message.
    # If they return nil, we have the else processing:
    # First collect the error and put it in the flash.now.alert
    # Then do the render, which basically means put the previous screen back up.
    @senior = Senior.new(senior_params)
    if @senior.save
      flash.notice = "The senior record was created successfully."
      redirect_to @senior
    else
      flash.now.alert = @senior.errors.full_messages.to_sentence
      render :new
    end
  end

  # PATCH/PUT /seniors/1
  # PATCH/PUT /seniors/1.json
  def update
    # update Method with Error Processing
    # If @senior.update return non-nil values, that means they succeeded,
    # and we can redirect back to the show page with a success message.
    # If they return nil, we have the else processing:
    # First collect the error and put it in the flash.now.alert
    # Then do the render, which basically means put the previous screen back up.
    if @senior.update(senior_params)
      flash.notice = "The senior record was updated successfully."
      redirect_to @senior
    else
      flash.now.alert = @senior.errors.full_messages.to_sentence
      render :edit
    end
  end

  # DELETE /seniors/1
  # DELETE /seniors/1.json
  def destroy
    @senior.destroy
    respond_to do |format|
      format.html { redirect_to seniors_url, notice: 'Senior record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_senior
      @senior = Senior.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def senior_params
      params.require(:senior).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to seniors_path
    end
end
