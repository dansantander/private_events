class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    user_invitations = @user.invitations

    @myevents = []
    @prev_event = []
    @upcoming_event = []
    @unconfirmed_invitations = []

    user_invitations.each do |invit|
      event_id = invit.attended_event_id
      event = Event.find(event_id)
      confirmed = invit.confirmation

      @prev_event << event if event.event_date.past? && confirmed
      @upcoming_event << event if !event.event_date.past? && confirmed
      @unconfirmed_invitations << invit if confirmed == false
    end

    @events = Event.all
    @events.each do |ev|
      @myevents << ev if ev.creator_id == session[:private_event_user_id]
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
      session[:private_event_user_id] = @user.id
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
