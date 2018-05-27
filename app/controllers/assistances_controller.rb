class AssistancesController < ApplicationController
  def index
    @users = User.where(role: 'docente')
  end

  def create
    @user = User.find(params[:user_id])
    @assistance = @user.assistances.create(assistance_params)
    redirect_to user_path(@user)
  end

  private
  def assistance_params
    params.require(:assistance).permit(:fecha, :accion)
  end

end
