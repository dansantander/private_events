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
    @event = @user.created_events.create(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      flash.now
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @users = User.all
    @session_id = session[:private_event_user_id]
    @confirmed_attendants_id = []
    @attendants = []

    @event&.invitations&.each do |invitation|
      @confirmed_attendants_id << invitation.invitee_id if invitation.confirmation == true
    end

    @users.each do |u|
      @confirmed_attendants_id.each do |ca|
        @attendants << u.name if u.id == ca
      end
    end
  end
end
