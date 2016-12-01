class CreateInvitation
  attr_reader :invitation

  def initialize(invitation_params)
    @invitation_params = invitation_params
  end

  def save
    @invitation = Invitation.new(@invitation_params)
    return false unless @invitation.save
    User.find_by(email: @invitation.email).present? ? invite_registered_user : invite_new_user
  end

  private

  def invite_new_user
    InvitationMailer.invite_new_user(@invitation).deliver  
  end

  def invite_registered_user
    InvitationMailer.invite_registered_user(@invitation).deliver 
  end



  # def perform
  #   @invitation.sender = @user

  #   if @invitation.save
  #     if is_new_user?(@invitation.email)
  #       InvitationMailer.invite_new_user(@invitation).deliver     
  #     else
  #       InvitationMailer.invite_registered_user(@invitation).deliver 
  #       add_registered_user_to_board(@invitation.email, @invitation.board_id)
  #     end
  #     true
  #   else
  #     false
  #   end
  # end

  # private

  # def is_new_user?(email)
  #   return true unless User.find_by_email(email)
  # end
end