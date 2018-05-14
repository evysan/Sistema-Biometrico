class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :register_hash
  skip_before_action :require_login, only: :register_hash

  def new
  end

  def create
    hostname = 'localhost'
    port = 23456
    @user = User.new(user_params)
    @user.save
    s = TCPSocket.new(hostname, port)
    s.puts("{ \"userid\": #{@user.id}, \"method\": \"register\" }")
    s.close
    redirect_to @user
  end

  def index
  @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    unless User.is_admin?(@user)
      @user.destroy
    end
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(@user)
    else
      render "edit"
    end
  end

  def register_hash
    @user = User.find(params[:id])
    @user.update_attribute('shahash', params[:shahash])
  end


  private
  def user_params
    params.require(:user).permit(:firtsname, :lastname, :gender, :phone, :role, :identification, :email, :password)
  end
end
