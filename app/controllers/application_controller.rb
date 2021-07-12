class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    landscaping_services_path
  end
end
