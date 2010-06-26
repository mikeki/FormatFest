class PagesController < ApplicationController
  
  def about
  @title ="About"
  end

  def contact
  @title = "Contact"
  end

  def developers
  @title = "SAITC"
  end
  
  def home
  @title = "Bienvenido"
    
  end


end
