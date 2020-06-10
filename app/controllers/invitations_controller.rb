class InvitationsController < ApplicationController
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

    already_invited = Invitation.find_by_sql "
    SELECT id, invitee_id, attended_event_id FROM invitations
    WHERE invitee_id = #{@invitation.invitee_id} AND
    attended_event_id = #{@invitation.attended_event_id}"

    if !already_invited.empty?
      flash.now[:message] = 'User has already been invited'
      render 'new'
      nil
    else
      @invitation.save
      flash.notice = 'Invitation Successful !!'
      redirect_to events_path(@event)
    end
  end

  def update
    @invitation = Invitation.find(params[:id])

    @invitation.update_attribute(:confirmation, params[:confirmation] = true)
    @event = @invitation.attended_event_id

    redirect_to event_path(@event)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invitee_id, :attended_event_id)
  end
end
