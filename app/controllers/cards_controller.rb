class CardsController < ApplicationController
    before_action :set_card, only: [:show]
    def new
        @list = List.find(params[:list_id])
        @card = Card.new
    end
    
    def create
        @card = Card.new(card_params)
        @list = List.find(params[:list_id])
        @card.list = @list
        respond_to do |format|
            if @card.save
            format.html { redirect_to root_path, notice: 'Card was successfully created.' }
            format.json { render :show, status: :created, location: @list }
            else
            format.html { render :new }
            format.json { render json: @card.errors, status: :unprocessable_entity }
            end
        end
    end
      
    def show
          
    end
      
    private
      
    def card_params
        params.require(:card).permit(:body)
    end
    
    def set_card
       @card = Card.find(params[:card_id]) 
    end
end
