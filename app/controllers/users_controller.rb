class UsersController < ApplicationController
  
  before_filter :require_user, :except => [:new, :create]
  before_filter :not_admins, :only => [:index, :destroy,:show_admin, :busqueda]
  
  def index
  @title = "Listado de usuarios"
  @users = User.search(params[:search])
  end
  
  def new
  @title = "Registro"
  @user = User.new

  end

  def create
  @user = User.new(params[:user])
	  if @user.save
		flash[:notice] = "El usuario fue creado satisfactoriamente."	  
		redirect_to root_path
		else
		flash[:error] = "El usuario no pudo crearse."
		render 'new'
	  end
  end

  def edit
  	if current_user.admin? or current_user.colaborator?
  		@user = User.find(params[:id])
  	else
  		@user = current_user
  	end
  end

  def update
  @user = User.find(params[:id])
  
  	if @user.update_attributes(params[:user])
  		flash[:notice] = "El usuario se actualizo chido"
  		redirect_to @user
  		else
  		flash[:error] = "Algo salio mal :S"
  		render 'edit'
  	end
  
  end

  def show
      @laptop = Laptop.new
  	if current_user.admin? or current_user.colaborator?
  		@user = User.find(params[:id])
  	else
  	
  		@user = current_user
  	end
  @title = "#{@user.fname.capitalize} #{@user.lname.capitalize}"
  end
  
  def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to (users_url)
  end
  
  def show_admin
    if current_user.admin? or current_user.colaborator?
  		@user = User.find(params[:id])
    end
end

end
