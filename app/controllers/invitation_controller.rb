class InvitationController < ApplicationController
  before_action :authenticate_user!
  before_action :invitation_exists?, only: [:create]

  def create
    event = Event.find(params[:event])
    invitation = Invitation.build(event_id: event.id, user_id: current_user.id)

    if invitation.save
      redirect_to event, notice: 'You are now part of the attendees of this event!'
    else
      redirect_to event, alert: 'Invitation failed'
    end
  end

  def destroy
    event = Event.find(params[:event])
    invitation = Invitation.find_by(event_id: event.id, user_id: current_user.id)
    invitation.destroy

    redirect_to event, notice: "Your attendance to this event is now cancelled"
  end

  private

  def invitation_exists?
    event = Event.find(params[:event])

    if Invitation.find_by(event_id: event.id, user_id: current_user.id)
      redirect_to event, alert: 'You are already part of the attendees!'
    end
  end
end
