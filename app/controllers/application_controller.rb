class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def current_user
    @_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      flash[:error] = "Usted debe estar logueado para usar esta funcionalidad"
      redirect_to login_path
    end
  end
end
