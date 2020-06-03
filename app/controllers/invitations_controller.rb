class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
  
    if @invitation.save
      flash[:success] = 'Invitation Successful !!'
      redirect_to invitations_path(@invitation)
    else
      render 'new'
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:invitee_id, :attended_event_id)
  end
end
