class ListsController < ApplicationController
    
  before_action :set_list, only: [:show, :destroy, :edit, :update]
  def new
    @list = board.lists.new
  end
  
  def create
    @list = board.lists.new(list_params)
    if @list.save
      redirect_to root_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def update
  respond_to do |format|
    if @list.update(list_params)
      format.html { redirect_to root_path, notice: 'List was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end
    
  def show
        
  end

  def edit

  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'List was successfully destroyed.' }
    end
  end
    
  private

  def board
    @board ||= Board.find(params[:board_id])
  end
    
  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find(params[:id]) 
  end
    
end
