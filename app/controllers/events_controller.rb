class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show 
    @events = Event(find.params[:id])
  end

  def create 
    @event = @user.build_event(params[:event])
    if @event.save 
      redirect_to events_path
    else
      render :new
    end
    
  end

end
