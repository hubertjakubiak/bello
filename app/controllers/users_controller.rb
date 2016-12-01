class UsersController < ApplicationController
  skip_before_action :authenticate
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      assign_user_as_member if token.present?
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def token
    params[:user][:token]
  end

  def assign_user_as_member
    invitation = Invitation.find_by(token: token)
    invitation.board.members << @user
  end
end