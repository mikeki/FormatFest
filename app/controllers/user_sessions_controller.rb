class UserSessionsController < ApplicationController
 
 
  def new
  	@user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Bienvenido #{current_user.fname.capitalize}"
      redirect_to root_path
    else
      flash[:error] = "Usuario y/o password incorrectos."
      redirect_to root_path
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Has salido del sistema"
    redirect_to root_url
  end
end
