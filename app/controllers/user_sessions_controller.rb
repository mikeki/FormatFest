class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy 
 
  def new
  	@user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Bienvenido #{current_user.fname.capitalize}"
      if !current_user.admin? and !current_user.colaborator? and current_user.laptops.count == 0
        redirect_to new_laptop_path 
      else
        redirect_to root_path
      end
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
