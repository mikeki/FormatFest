class LaptopsController < ApplicationController

	before_filter :require_user
	before_filter :not_admins , :only => :index

  # GET /laptops
  # GET /laptops.xml
  def index
    @laptops = Laptop.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laptops }
    end
  end

  # GET /laptops/1
  # GET /laptops/1.xml
  def show
  	#@laptop = Laptop.find(:first, params[:id])
    if current_user.admin? or current_user.colaborator?
    	@laptop = Laptop.find(params[:id])
			@title = "laptop de #{@laptop.user.fname.capitalize} #{@laptop.user.lname.capitalize}"	
  	else
  		current_user.laptops.each do |l|
  			if l.id == params[:id]
  				@laptop = Laptop.find(params[:id])
					@title = "laptop de #{@laptop.user.fname.capitalize} #{@laptop.user.lname.capitalize}"
  			end
  		end
  	end
  	if @laptop.nil?
  		redirect_to current_user
  	end
  end

  # GET /laptops/new
  # GET /laptops/new.xml
  def new
    @laptop = Laptop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @laptop }
    end
  end

  # GET /laptops/1/edit
  def edit
    @laptop = Laptop.find(params[:id])
    @colaborator = Colaborator.new
  end

  # POST /laptops
  # POST /laptops.xml
  def create
    @laptop = Laptop.new(params[:laptop])

    respond_to do |format|
      if @laptop.save
        format.html { redirect_to(@laptop, :notice => 'Laptop was successfully created.') }
        format.xml  { render :xml => @laptop, :status => :created, :location => @laptop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @laptop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laptops/1
  # PUT /laptops/1.xml
  def update
    @laptop = Laptop.find(params[:id])
    @colaborador = Colaborator.new(params[:colaborator]) 

    respond_to do |format|
      if @laptop.update_attributes(params[:laptop]) and @colaborador.save
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
