class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  def index
    if params[:event_type]
      @events = Event.where(event_type: params[:event_type])
    else
      @events = Event.all
    end

    if (:event_type == "Interclub")
      @events_ic = Event.where(:event_type == "Interclub")
    else
      @events_ic = Event.all
    end
  end

  def show
    @inscriptions = Inscription.where(event_id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def find_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:name, :event_type, :tagline, :date)
  end
end
