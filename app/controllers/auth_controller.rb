class AuthController < ApplicationController
  skip_before_action :require_login, only: [:index, :login]

  def index
  end

  def login
    @user = User.find_by_identification params[:login][:identification]
    if @user && params[:login][:password] == @user.password
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:danger] = 'Usuario o contrasena incorrecta, por favor verifique'
      render 'index'
    end
  end

  def logout
    @_current_user = session[:user_id] = nil
    redirect_to login_path
  end
end
