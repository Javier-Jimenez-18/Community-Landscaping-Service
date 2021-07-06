class MyDatesController < ApplicationController
  before_action :set_my_date, only: %i[ show edit update destroy flatpickr_edit]

  # GET /my_dates or /my_dates.json
  def index
    @my_dates = MyDate.all
  end

  # GET /my_dates/1 or /my_dates/1.json
  def show
  end

  # GET /my_dates/new
  def new
    @my_date = MyDate.new
  end

  # GET /flatpickr_new
  def flatpickr_new
    @my_date = MyDate.new
    render 'new'
  end

  # GET /my_dates/1/edit
  def edit
  end

  # GET /flatpickr_edit/1
  def flatpickr_edit
    render 'edit'
  end

  # POST /my_dates or /my_dates.json
  def create
    @my_date = MyDate.new(my_date_params)

    respond_to do |format|
      if @my_date.save
        format.html { redirect_to @my_date, notice: "My date was successfully created." }
        format.json { render :show, status: :created, location: @my_date }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_dates/1 or /my_dates/1.json
  def update
    respond_to do |format|
      if @my_date.update(my_date_params)
        format.html { redirect_to @my_date, notice: "My date was successfully updated." }
        format.json { render :show, status: :ok, location: @my_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_dates/1 or /my_dates/1.json
  def destroy
    @my_date.destroy
    respond_to do |format|
      format.html { redirect_to my_dates_url, notice: "My date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_date
      @my_date = MyDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_date_params
      params.require(:my_date).permit(:dt)
    end
end
