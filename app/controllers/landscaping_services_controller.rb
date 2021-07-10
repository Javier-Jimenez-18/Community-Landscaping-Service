class LandscapingServicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_landscaping_service, only: [:show, :edit, :update, :destroy]

  # GET /landscaping_service/new
  def new
    @landscaping_service = LandscapingService.new
  end

  # GET /landscaping_services
  # GET /landscaping_services.json
  def index
    @landscaping_services = LandscapingService.all
  end

  # GET /landscaping_services/1
  # GET /landscaping_services/1.json
  def show
  end

  # GET /landscaping_services/1/edit
  def edit
  end

  # POST /landscaping_services
  # POST /landscaping_services.json
  def create
    # create Method with Error Handling:
    # If @landscaping_service.save return non-nil values, that means they succeeded,
    # and we can redirect back to the show page with a success message.
    # If they return nil, we have the else processing:
    # First collect the error and put it in the flash.now.alert
    # Then do the render to :new.
    @landscaping_service = LandscapingService.new(landscaping_service_params)
    if @landscaping_service.save
      flash.notice = "The landscaping service record was created successfully."
      redirect_to @landscaping_service
    else
      flash.now.alert = @landscaping_service.errors.full_messages.to_sentence
      render :new
    end
  end

  # PATCH/PUT /landscaping_services/1
  # PATCH/PUT /landscaping_services/1.json
  def update
    # update Method with Error Processing
    # If @landscaping_service.update return non-nil values, that means they succeeded,
    # and we can redirect back to the show page with a success message.
    # If they return nil, we have the else processing:
    # First collect the error and put it in the flash.now.alert
    # Then do the render to :edit.
    if @landscaping_service.update(landscaping_service_params)
      flash.notice = "The landscaping service record was updated successfully."
      redirect_to @landscaping_service
    else
      flash.now.alert = @landscaping_service.errors.full_messages.to_sentence
      render :edit
    end
  end

  # DELETE /landscaping_services/1
  # DELETE /landscaping_services/1.json
  def destroy
    @landscaping_service.destroy
    respond_to do |format|
      format.html { redirect_to landscaping_services_url, notice: 'The landscaping service record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landscaping_service
      @landscaping_service = LandscapingService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landscaping_service_params
      params.require(:landscaping_service).permit(:landscape_service, :fee_per_hour, :date_time, :student_id, :senior_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to landscaping_services_path
    end
end
