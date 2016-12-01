class InvitationsController < ApplicationController
  def create
    creator = CreateInvitation.new(invitation_params.merge!(sender: current_user))
    if creator.save
      redirect_to root_path, notice: "Invitation with id #{creator.invitation.id} was sent"
    else
      redirect_to root_path, alert: "Invitation was not sent because #{creator.invitation.errors.full_messages_for(:email).first}"
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :board_id)
  end
end