class AttendanceController < ApplicationController

  def show_attended_events
    @attended_events = current_user.attended_events
  end

  def create
    Attendance.create(user_id: current_user.id, event_id: params[:event_id])
    flash[:notice] = 'You have successfully attended this event.'
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Attendance.find_by(user_id: current_user.id, event_id: params[:event_id]).destroy
    flash[:notice] = 'You have successfully unattended this event.'
    redirect_to event_path
  end
end
