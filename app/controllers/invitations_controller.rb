class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invite_params)
    @invitation.sender = current_user

    if @invitation.save
      if is_new_user?(@invitation.email)
        InvitationMailer.invite_new_user(@invitation).deliver     
      else
        InvitationMailer.invite_registered_user(@invitation).deliver 
        add_registered_user_to_board(@invitation.email, @invitation.board_id)
      end
      flash[:notice] = 'Invitation was sent.'
      redirect_to :back

    else
      flash[:error] = 'Invitation wasn\'t sent.'
      redirect_to :back
    end
  end

  private

  def invite_params
    params.require(:invitation).permit(:email, :board_id)
  end

  def is_new_user?(email)
    return true unless User.find_by_email(email)
  end

  def add_registered_user_to_board(email, board_id)
    user = User.find_by_email(email)
    board = Board.find(board_id)
    board.members << user
  end
end