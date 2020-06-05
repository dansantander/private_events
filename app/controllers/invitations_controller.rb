class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
    @users = User.all
    @events = Event.all
  end
  
  def create
    @invitation = Invitation.new(invitation_params)
    @event = @invitation.attended_event_id

    if @invitation.save
      flash[:success] = 'Invitation Successful !!'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invitee_id, :attended_event_id)
  end
end
