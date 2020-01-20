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

  def scoped_user
    current_user.partner unless current_user.admin?
  end

  def after_sign_out_path_for(resource_or_scope)
    store_location_for(resource, admin_root_path)
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
