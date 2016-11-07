require "rails_helper"

RSpec.describe BoardsController do

  before { sign_in }

  let(:board) { create(:board)}
  context "GET index" do

    before {get :index}

    it "assigns @boards" do       
      expect(assigns(:boards)).to eq([board])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  let(:board) {create(:board)}
  describe "GET edit" do
    it "renders the edit template" do
      get :edit, id: board.id
      expect(response).to render_template(:edit)
    end
  end

  let(:board) {create(:board)}
  describe "DELETE destroy" do
    it "delete existing board" do
      board
      expect {delete :destroy, id: board.id}.to change {Board.count}.by(-1)
    end
  end

  let(:board) {create(:board)}
  let(:attr) {{id: board.id, title: 'Title updated'}}
  describe "PUT update" do
    it "updates title" do
      expect {put :update, id: board.id, board: attr}.to change {board.reload.title}.to('Title updated')
    end
  end

  let(:board) {create(:board)}
  describe "POST create" do
    it "create new board" do
      params = {board: { title: 'New title'}}
      expect {post :create, params}.to change {Board.count}.by(1)
    end
  end
end