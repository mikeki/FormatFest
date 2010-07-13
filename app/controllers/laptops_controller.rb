class LaptopsController < ApplicationController

	before_filter :require_user
	before_filter :not_admins , :only => :destroy
	before_filter :not_privileges, :only => [:index, :listaRegistradas, :listaRecibidas, :listaEmpezadas, :listaTerminadas, :listaEntregadas]

  # GET /laptops
  # GET /laptops.xml
  def index
    @laptops = Laptop.find(:all)
    @title = "Listando Laptops"
  end
	
	def listaRegistradas
    @laptops = Laptop.find(:all, :conditions => {:estado => 0})
    @title = "Listando Laptops"
  end
  
  def listaRecibidas
    @laptops = Laptop.find(:all, :conditions => {:estado => 1})
    @title = "Listando Laptops"
  end
  
  def listaEmpezadas
    @laptops = Laptop.find(:all, :conditions => {:estado => 2})
    @title = "Listando Laptops"
  end
  
  def listaTerminadas
    @laptops = Laptop.find(:all, :conditions => {:estado => 3})
    @title = "Listando Laptops"
  end
  
  def listaEntregadas
    @laptops = Laptop.find(:all, :conditions => {:estado => 4})
    @title = "Listando Laptops"
  end

  # GET /laptops/1
  # GET /laptops/1.xml
  def show
    
  @laptop = Laptop.find(params[:id])
  @title = "Laptop de #{@laptop.user.fname.capitalize} #{@laptop.user.lname.capitalize}"
  redirect_to current_user unless current_user?(@laptop.user) or current_user.admin? or current_user.colaborator?

  end

  # GET /laptops/new
  def new
  	@title = "Registrar una Nueva Laptop"
  	@laptop = Laptop.new
  end


  # GET /laptops/1/edit
  def edit
    @laptop = Laptop.find(params[:id])
    @title = "Editando Laptop: #{@laptop.marca} #{@laptop.color}, Folio: #{@laptop.id}"
    @colaborator = Colaborator.new
  end

  # POST /laptops
  # POST /laptops.xml
  def create
    @laptop = current_user.laptops.build(params[:laptop])
      if @laptop.save
        redirect_to current_user
      end
  end

  # PUT /laptops/1
  # PUT /laptops/1.xml
  def update
    @laptop = Laptop.find(params[:id])
    @colaborador = Colaborator.new(params[:colaborator]) 

    respond_to do |format|
      if @laptop.update_attributes(params[:laptop]) and @colaborador.save
      	@laptop.update_attribute(:estado, "#{@laptop.colaborators.count}")
        format.html { redirect_to(@laptop, :notice => 'Laptop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @laptop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laptops/1
  # DELETE /laptops/1.xml
  def destroy
    @laptop = Laptop.find(params[:id])
    @laptop.destroy

    respond_to do |format|
      format.html { redirect_to(laptops_url) }
      format.xml  { head :ok }
    end
  end
end
