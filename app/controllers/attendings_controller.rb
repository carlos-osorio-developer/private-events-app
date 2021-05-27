class AttendingsController < ApplicationController
  def attend
    @event = Event.find_by_id(params[:id])
    record = current_user.attendings.build(attended_event_id: @event.id)
    if record.save
      redirect_to @event
    else
      redirect_to @event, notice: "User already attending"
    end
  end
end
