require "rails_helper"

RSpec.describe BoardsController, type: :controller do

  before do
    ApplicationController.any_instance.stub(:current_user).and_return(true)
  end

  describe "GET index" do
    it "assigns @boards" do
      board = Board.create
      get :index
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

  let(:board) {FactoryGirl.create(:board)}
  describe "GET edit" do
    it "renders the index template" do
      get :edit, id: board.id
      expect(response).to render_template(:edit)
    end
  end

  let(:board) {FactoryGirl.create(:board)}
  describe "DELETE destroy" do
    it "delete existing board" do
      delete :destroy, id: board.id

      expect(Board.count).to eq(0)
    end
  end

  let(:board) {FactoryGirl.create(:board)}
  let(:attr) {{id: board.id, title: 'Title updated'}}
  describe "PUT update" do
    it "update title" do
      put :update, id: board.id, board: attr
      board.reload
      expect(board.title).to eq('Title updated')
    end
  end

  describe "POST create" do
    it "create new board" do
      params = {board: { title: Faker::Lorem.sentence}}
      post :create, params

      expect(Board.count).to eq(1)
    end
  end
end