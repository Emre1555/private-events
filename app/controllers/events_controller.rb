class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = 'Event was successfully created'
      redirect_to @event
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = 'Event was successfully deleted'
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
