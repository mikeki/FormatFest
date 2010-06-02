class UsersController < ApplicationController
  
  def index
  @title = "No me creen"
  @users = User.find(:all)
  end
  
  def new
  @title = "Registro"
  @user = User.new

  end

  def create
  @user = User.new(params[:user])
	  if @user.save
		flash[:notice] = "El usuario fue creado satisfactoriamente"	  
		redirect_to root_path
		else
		flash[:error] = "Tas bien wey"
		render 'new'
	  end
  end

  def edit
  @user = User.find(params[:id])
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
  @user = User.find(params[:id])
  @title = @user.name.capitalize
  end
  
  def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to (users_url)
  end

end
