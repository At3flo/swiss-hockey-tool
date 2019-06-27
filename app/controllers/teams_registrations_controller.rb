class TeamsRegistrationsController < ApplicationController
  def create
    @inscription = Inscription.new(inscription_params)
    
    if @inscription.save
      redirect_to root_path
    else
      flash[:notice] ='ERROR: Registration was not created contact your admin'
      redirect_to root_path
    end

  end

  def destroy
    @inscription = Inscription.find(params[:id])
    @inscription.destroy
    
    redirect_to root_path
  end

  private

  def inscription_params
    params.permit(:team_name, :event_id, :club_id, :category_id) 
  end
end
