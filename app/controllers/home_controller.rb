class HomeController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found

  def index
  end

  private
    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to home_index_path
    end
end
