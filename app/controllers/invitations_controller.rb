class InvitationsController < ApplicationController
  include  InvitationsHelper

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
    @user = session[:private_event_user_id]
  end
  
  def show
    @invitation = Invitation.find(params[:id])
    event_id = @invitation.attended_event_id
    @event = Event.find(event_id)
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

  def update
    @invitation = Invitation.find(params[:id])
    puts "*****------#{@invitation.confirmation}-------****"
    @invitation.update_attribute(:confirmation, params[:confirmation] = true)
    @event = @invitation.attended_event_id
    
    redirect_to event_path(@event)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invitee_id, :attended_event_id)
  end
end
