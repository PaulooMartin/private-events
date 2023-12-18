class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_if_host, only: [:destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    event = current_user.hosted_events.find(params[:event])
    event.destroy

    redirect_to user_path(current_user.username), notice: 'Your event is now deleted'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime)
  end

  def check_if_host
    event = Event.find(params[:event])
    redirect_to root_path, alert: 'You are not the owner of this event' unless (current_user == event.creator)
  end
end
