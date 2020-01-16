class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  
  private

  def grant
    current_user.partner.grants.first
  end
end
