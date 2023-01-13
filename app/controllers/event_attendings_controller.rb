class EventAttendingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_attending = current_user.event_attendings.create(attended_event_id: @event.id)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_attending = current_user.event_attendings.find_by(attended_event_id: @event.id)
    @event_attending.destroy
    redirect_to event_path(@event)
  end
end
