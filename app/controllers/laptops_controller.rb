class LaptopsController < ApplicationController

	before_filter :require_user
	#before_filter :not_admins , :only => :destroy
	before_filter :not_privileges, :only => [:index, :listaRegistradas, :listaRecibidas, :listaEmpezadas, :listaTerminadas, :listaEntregadas]

  # GET /laptops
  # GET /laptops.xml
  def index
    @title= "Listado de laptops"
    unless params[:id].nil?
      begin
        laptop=Laptop.find(params[:id])
      rescue
        redirect_to laptops_path
      else
        redirect_to laptop
      end
    end
    if params[:estado] == '-1' or params[:estado].nil?
        @laptops = Laptop.paginate(:page=>params[:page], :per_page => 10, :order => "id asc")

    else
      @laptops = Laptop.paginate(:page=>params[:page], :per_page => 10, :order => "id asc", :conditions=> {:estado => params[:estado]})
    end
  end
  
  def estadisticas
    @lap = Laptop.find(:all)
  	@laptops = Laptop.find(
  		:all,
  		:select => "count(estado) AS count, estado", 
  		:group => "estado",
  		:order => "estado asc")
  	@marca = Laptop.find(
  	:all,
  	:select => "count(marca) AS count, marca",
  	:group => "marca",
  	:conditions => ['estado > 0']
  	)
  	@top5Recibidas = Colaborator.find(
  	:all,
  	:select => "count(user_id) AS count, user_id",
  	:group => "user_id",
  	:order => "count desc",
  	:conditions => {:status => "Recibir"},
  	:limit => 5
  	)
  	@top5Empezadas = Colaborator.find(
  	:all,
  	:select => "count(user_id) AS count, user_id",
  	:group => "user_id",
  	:order => "count desc",
  	:conditions => {:status => "Empezar"},
  	:limit => 5
  	)
  	@top5Terminadas = Colaborator.find(
  	:all,
  	:select => "count(user_id) AS count, user_id",
  	:group => "user_id",
  	:order => "count desc",
  	:conditions => {:status => "Terminar"},
  	:limit => 5
  	)
  	@top5Entregadas = Colaborator.find(
  	:all,
  	:select => "count(user_id) AS count, user_id",
  	:group => "user_id",
  	:order => "count desc",
  	:conditions => {:status => "Entregar"},
  	:limit => 5
  	)
  	@title = "Estadísticas a las #{Time.now.to_formatted_s(:time)} horas"
  end

  # GET /laptops/1
  # GET /laptops/1.xml
  def show
    begin
      @laptop = Laptop.find(params[:id])
    rescue
      redirect_to laptops_path
    else
      @title = "Laptop de #{@laptop.user.fname.capitalize} #{@laptop.user.lname.capitalize}"
      redirect_to current_user unless current_user?(@laptop.user) or current_user.admin? or current_user.colaborator?
    end
  end

  # GET /laptops/new
  def new
  	@title = "Registrar una Nueva Laptop"
  	@laptop = Laptop.new 
  	@programas = Program.new
  end


  # GET /laptops/1/edit
  def edit
    @laptop = Laptop.find(params[:id])
    @programas = @laptop.program
    @title = "Editando Laptop: #{@laptop.marca} #{@laptop.modelo} con folio: #{@laptop.id}"
    @colaborator = Colaborator.new
  end

  # POST /laptops
  # POST /laptops.xml
  def create
    @laptop = current_user.laptops.build(params[:laptop])
    @programas = @laptop.build_program(params[:program])
    if @laptop.save
      if @laptop.paquete == "basico"
        if @laptop.promo?
          @laptop.update_attribute(:total,160)
        else
          @laptop.update_attribute(:total,180)
        end
      else
        if @laptop.promo?
          @laptop.update_attribute(:total,180)
        else
          @laptop.update_attribute(:total,200)
        end
      end
      if @programas.save
        LaptopMailer::deliver_registered_message(@laptop, @laptop.user.email)
        flash[:notice] = "Se registró una laptop satisfactoriamente. Revisa tu correo para instrucciones"
        redirect_to @laptop
      end
    else
      flash[:error] ="Ocurrio un problema al registrar la laptop."
      @title = "Registrar una Nueva Laptop"
      render 'new'
    end
  end

  # PUT /laptops/1
  # PUT /laptops/1.xml
  def update
    @laptop = Laptop.find(params[:id])
    if @laptop.estado < 5 and params[:justUpdate] != '1'
    	@colaborador = Colaborator.new(params[:colaborator])
    	@colaborador.save
    end 

    respond_to do |format|
      if @laptop.update_attributes(params[:laptop]) and @laptop.program.update_attributes(params[:program])
        if params[:justUpdate] != '1'
      	  @laptop.update_attribute(:estado, "#{@laptop.colaborators.count}")
        end
      	if @laptop.estado == 3 and params[:justUpdate] != '1'
  	      LaptopMailer::deliver_end_message(@laptop, @laptop.user.email)
	      end
      	if @laptop.paquete == "basico"
          if @laptop.promo?
            @laptop.update_attribute(:total,160)
          else
            @laptop.update_attribute(:total,180)
          end
        else
          if @laptop.promo?
            @laptop.update_attribute(:total,180)
          else
            @laptop.update_attribute(:total,200)
          end
        end
        format.html { redirect_to(@laptop, :notice => 'La laptop se actualizo satisfactoriamente.') }
        format.xml  { head :ok }
      else
        @title = "Editando Laptop: #{@laptop.marca} #{@laptop.color} con folio: #{@laptop.id}"
        format.html { render :action => "edit", :error => 'Ocurrio un error al actualizar la laptop.' }
        format.xml  { render :xml => @laptop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laptops/1
  # DELETE /laptops/1.xml
  def destroy
    @laptop = Laptop.find(params[:id])
    if (@laptop.user == current_user and @laptop.estado==0) or current_user.admin? 
    	@laptop.destroy
      respond_to do |format|
        format.html { redirect_to(laptops_url, :notice => 'Se elimino la laptop satisfactoriamente.') }
        format.xml  { head :ok }
      end
    else
      flash[:error] = 'Imposible eliminar la laptop.'
      redirect_to :back
    end
  end


end
