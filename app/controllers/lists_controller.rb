class ListsController < ApplicationController
    
  before_action :set_list, only: [:show, :destroy, :edit, :update]
  def new
    @board = Board.find(params[:board_id])
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    @board = Board.find(params[:board_id])
    @list.board = @board
    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: 'List was successfully created.' }
      else
        format.html { render :new }
      end
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
    
  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find(params[:id]) 
  end
    
end
