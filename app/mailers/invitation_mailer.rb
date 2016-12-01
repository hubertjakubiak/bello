class InvitationMailer < ApplicationMailer
  def invite_new_user(invitation)
    @invitation = invitation
    send_email(@invitation.email, 'You were added to Bello board. Sign up!')
  end

  def invite_registered_user(invitation)
    @invitation = invitation
    send_email(@invitation.email, 'You were added to new board!')
  end

  private 

  def send_email(email, subject)
    mail(to: email, subject: subject)
  end
end