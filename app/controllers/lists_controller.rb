class ListsController < ApplicationController
    
    before_action :set_list, only: [:show]
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
            format.html { redirect_to @board, notice: 'List was successfully created.' }
            format.json { render :show, status: :created, location: @board }
            else
            format.html { render :new }
            format.json { render json: @board.errors, status: :unprocessable_entity }
            end
        end
    end
      
    def show
          
    end
      
    private
      
    def list_params
        params.require(:list).permit(:title)
    end
    
    def set_list
       @list = List.find(params[:id]) 
    end
    
end
