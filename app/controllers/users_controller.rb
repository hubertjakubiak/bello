class UsersController < ApplicationController
  skip_before_action :authenticate
  
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id

      if user.token
        invitation = Invitation.find_by_token(user.token)
        board = Board.find(invitation.board_id)
        board.members << user
      end
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :token)
  end

end