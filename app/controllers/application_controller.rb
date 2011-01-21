# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	before_filter :create_session
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user
  
#----------------------------------------------------
# muestra la forma de contacto
#----------------------------------------------------
  def contact
    @title = "Contacto"
    @contact = Contact.new
  end
  
#----------------------------------------------------
# procesa el email
#----------------------------------------------------
  def enviar_mensaje
    @contact = Contact.new(params['contact'])
    if @contact.save
      begin
        ContactMailer::deliver_contact_message(@contact)
        flash[:notice] = 'El mensaje fue enviado satisfactoriamente.'
        redirect_to root_path
      rescue
        @title="Contacto"
        flash[:error] = 'Ocurrió un problema al enviar el mensaje.'
        render :action=>"contact"
      end
    else
      @title="Contacto"
      render :action=>"contact"
    end
  end
  
  private
  
  def create_session
  	if !@current_user
  		@user_session = UserSession.new
  	end
  end
  
  def current_user_session
  	return @current_user_session if defined?(@current_user_session)
  	@current_user_session = UserSession.find
  end
  
  def current_user
  	return @current_user if defined?(@current_user)
  	@current_user = current_user_session && current_user_session.record
  end
  
  def current_user?(user)
  user == current_user
  end
  
  def require_user
  	unless current_user
  		#store_location
    	flash[:notice] = "You must be logged in to access this page"
    	redirect_to root_path
    	return false
    end
  end
  
  def not_admins
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
  
  def not_privileges
  	if !(current_user.admin? or current_user.colaborator?)
  		redirect_to root_path
  	end
  end
  
end
