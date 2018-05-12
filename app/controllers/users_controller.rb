class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.new(user_params)
    @user.save
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
    @user.destroy

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




  private
  def user_params
    params.require(:user).permit(:firtsname, :lastname, :gender, :phone, :role, :identification, :email, :password)
  end
end
