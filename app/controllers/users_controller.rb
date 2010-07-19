class UsersController < ApplicationController

  
  before_filter :require_user, :except => [:new, :create]
  before_filter :not_admins, :only => [:destroy]
  before_filter :not_privileges, :only => [:index, :show_admin, :busqueda]
  
  def index
    if params[:usuario] == "3"
      @title = "Listado de Administradores y Colaboradores"
      @users = User.paginate(:page => params[:page],:per_page=>10, :conditions => ['email LIKE ? AND admin = 1 or colaborator = 1', "%#{params[:search]}%"])
    elsif params[:usuario] == "2"
      @title = "Listado de Administradores"
      @users = User.paginate(:page => params[:page],:per_page=>10, :conditions => ['email LIKE ? AND admin = 1', "%#{params[:search]}%"])
    elsif params[:usuario] == "1"
      @title = "Listado de Colaboradores"
      @users = User.paginate(:page => params[:page],:per_page=>10, :conditions => ['email LIKE ? AND colaborator = 1', "%#{params[:search]}%"])
    elsif params[:usuario] == "0"
      @title = "Listado de Clientes"
      @users = User.paginate(:page => params[:page],:per_page=>10, :conditions => ['email LIKE ? AND admin = 0 AND colaborator = 0', "%#{params[:search]}%"])
    else 
      @title = "Listado de todos los Usuarios"
      @users = User.paginate(:page => params[:page],:per_page=>10, :conditions => ['email LIKE ?', "%#{params[:search]}%"])
    end
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
		@title = "Registro"
		render 'new'
	  end
  end

  def edit
  	if current_user.admin? or current_user.colaborator?
  		@user = User.find(params[:id])
  	else
  		@user = current_user
  	end
  	@title = "Editando a #{@user.fname} #{@user.lname}"
  end

  def update
  @user = User.find(params[:id])
  
  	if @user.update_attributes(params[:user])
  		flash[:notice] = "El usuario se actualizo satisfactoriamente."
  		redirect_to @user
  		else
  		flash[:error] = "El usuario no pudo actualizarse."
  		render 'edit'
  	end
  
  end

  def show
  	if current_user.admin? or current_user.colaborator?
  		@user = User.find(params[:id])
  	else
  		@user = current_user
  	end
  	
    @title = "#{@user.fname.capitalize} #{@user.lname.capitalize}"
    unless @user.colaborators.empty?
      @colaborators = @user.colaborators.find(:all, :order=>"laptop_id, created_at")
    end
  end
  
  def destroy
  @user = User.find(params[:id])
  @user.destroy
  flash[:notice] = "Usuario eliminado satisfactoriamente."
  redirect_to (users_url)
  end
  
  def show_admin
    if current_user.admin? or current_user.colaborator?
  		@user = User.find(params[:id])
    end
end

end
