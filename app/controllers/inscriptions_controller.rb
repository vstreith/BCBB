class InscriptionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.inscriptions.create! user: current_user

    respond_to do |format|
      format.html { redirect_to events_path }
      format.js
    end
  end

  def destroy
    inscription = Inscription.find(params[:id])
    @event = inscription.event
    inscription.destroy

    respond_to do |format|
      format.html { redirect_to events_path }
      format.js
    end
  end
end
