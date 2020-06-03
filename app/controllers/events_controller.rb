class EventsController < ApplicationController
  include EventsHelper

  def index
    @events = Event.all
    @past = Event.past
    @upcoming = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    user_id = session[:private_event_user_id]
    @user = User.find(user_id)
    @event = @user.events.create(event_params)

    if @event.save
      redirect_to events_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    # @event = Event.find(params[:id])
  end
end
