class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :info, :date)
  end
end
