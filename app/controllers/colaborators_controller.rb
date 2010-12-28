class ColaboratorsController < ApplicationController
  
  def destroy
    @colaborator = Colaborator.find(params[:id])
    if current_user.admin?
      @colaborator.laptop.update_attribute(:estado, @colaborator.laptop.estado - 1)
      if @colaborator.laptop.estado == 0
        @colaborator.laptop.update_attribute(:receivedTime, nil)
      end 
    	@colaborator.destroy
      respond_to do |format|
        format.html { redirect_to(:back, :notice => 'Se elimino el registro del colaborador.') }
        format.xml  { head :ok }
      end
    else
      flash[:error] = 'Imposible eliminar el registro del colaborador.'
      redirect_to :back
    end
  end
  
end
