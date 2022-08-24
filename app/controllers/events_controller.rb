class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event= current_user.created_events.build
    end

    def create
        @event = current_user.created_events.build(event_params)
    end
end
