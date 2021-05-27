class AttendingsController < ApplicationController

  def attend
    @event = Event.find_by_id(params[:id])
    record = current_user.attendings.build(attended_event_id: @event.id)
    record.save
    redirect_to @event
  end

end
