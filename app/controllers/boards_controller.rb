class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def edit
    board
  end

  def update
    if board.update(board_params)
      redirect_to root_path, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
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
end