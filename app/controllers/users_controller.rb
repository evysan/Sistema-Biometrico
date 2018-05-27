class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:register_hash, :register_assistance, :toggle_maintenance]
  skip_before_action :require_login, only: [:register_hash, :register_assistance]

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
      hostname = 'localhost'
      port = 23456
      s = TCPSocket.new(hostname, port)
      s.puts("{ \"userpos\": #{@user.userpos}, \"method\": \"delete\" }")
      s.close
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
    @user.update_attribute('userpos', params[:userpos])
  end

  def register_assistance
    @user = User.find_by_shahash(params[:shahash])
    @assistance = @user.assistances.last
    if @assistance.nil?
      @assistance = @user.assistances.create(fecha: params[:fecha], accion: 'ingreso')
      if @user.gender == 'F'
        return render plain: "Bienvenida #{@user.firtsname}"
      else
        return render plain: "Bienvenido #{@user.firtsname}"
      end
    else
      @accion = ''
      if @assistance.accion == 'ingreso'
        @assistance = @user.assistances.create(fecha: params[:fecha], accion: 'egreso')
        return render plain: "Adios #{@user.firtsname}"
      else
        @assistance = @user.assistances.create(fecha: params[:fecha], accion: 'ingreso')
        if @user.gender == 'F'
          return render plain: "Bienvenida #{@user.firtsname}"
        else
          return render plain: "Bienvenido #{@user.firtsname}"
        end
      end
    end
  end

  def toggle_maintenance
    hostname = 'localhost'
    port = 23456
    s = TCPSocket.new(hostname, port)
    s.puts("{ \"maintenance_mode\": #{params[:toggle]}, \"method\": \"maintenance\" }")
    s.close
  end


  private

  def user_params
    params.require(:user).permit(:firtsname, :lastname, :gender, :phone, :role, :identification, :email, :password)
  end
end
