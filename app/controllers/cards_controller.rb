class CardsController < ApplicationController
  before_action :set_card, only: [:show, :destroy, :edit, :update]
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
        else
        format.html { render :new }
      end
    end
  end
    
  def show
        
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to root_path, notice: 'Card was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @card.destroy
      respond_to do |format|
      format.html { redirect_to root_path, notice: 'Card was successfully destroyed.' }
    end
  end
    
  private
    
  def card_params
    params.require(:card).permit(:body)
  end
  
  def set_card
    @card = Card.find(params[:id]) 
  end

end
