class ListsController < ApplicationController
  def new
    @list = board.lists.new
    authorize @list
  end

  def create
    @list = board.lists.new(list_params)
    authorize @list
    if @list.save
      redirect_to root_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize list
    board
  end

  def update
    authorize list
    if list.update(list_params)
      redirect_to root_path, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize list
    list.destroy
    redirect_to root_path, notice: 'List was successfully destroyed.'
  end

  private

  def list
    @list ||= List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def board
    @board ||= Board.find(params[:board_id])
  end
end