class InscriptionsController < ApplicationController

  helper_method :destroy?

  def create
    @inscription = Inscription.new(inscription_params)
    @event = Event.find(@inscription.event_id)

    authorize @inscription

    if @event.places_left > 0 && @inscription.save
      @event.places_left -= 1
      @event.is_tournament_open = false if @event.places_left == 0
      if @event.save
        redirect_to root_path
      else
        flash[:alert] ='ERROR: Places left were not updated but event was created contact the sysadmin'
        redirect_to root_path
      end
    else
      flash[:alert] ='Registration was not created! There seems to be no more places left. Contact the organizer.'
      redirect_to root_path
    end

  end

  def destroy
    @inscription = Inscription.find(params[:id])
    
    authorize @inscription
    
    @event = Event.find(@inscription.event_id)
    @event.places_left += 1
    if @event.save
      @inscription.destroy
      redirect_to root_path
    else
      flash[:alert] ='ERROR: Places left were not updated and event was not deleted contact your admin'
      redirect_to root_path
    end
  end

  private

  def inscription_params
    params.permit(:team_name, :event_id, :club_id, :category_id) 
  end
end
