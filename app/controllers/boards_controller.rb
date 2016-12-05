class BoardsController < ApplicationController
  def index   
    assign_current_user_as_member if token.present?

    @own_boards = current_user.ownerships.includes(:lists)
    @member_boards = current_user.member_boards.includes(:lists)
    #Board.includes(:memberships).where('memberships.user_id = ? OR owner_id = ?', 1, 1).references(:memberships)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.owner = current_user
    if @board.save
      redirect_to root_path, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize board
    @invitation = Invitation.new
  end

  def update
    authorize board
    if board.update(board_params)
      redirect_to root_path, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize board
    board.destroy
    redirect_to root_path, notice: 'Board was successfully destroyed.'
  end

  private

  def board
    @board ||= Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end

  def token
    params[:invitation_token]
  end

  def assign_current_user_as_member
    invitation = Invitation.find_by(token: token)
    invitation.board.members << current_user
  end
end