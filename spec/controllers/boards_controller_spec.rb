require "rails_helper"

describe BoardsController do

  before {sign_in}
  let(:user) {current_user}
  let(:board) {create(:board, owner: user)}
  
  context "GET index" do 
    let(:call) {get :index}

    before {call}

    it "assigns @boards" do       
      expect(assigns(:own_boards)).to eq([board])
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

  describe "GET edit" do 
    it "renders the edit template" do
      get :edit, id: board.id
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE destroy" do
    let!(:board) {create(:board, owner: user)}
    let(:call) {delete :destroy, id: board.id}
    it "delete existing board" do
      expect {call}.to change {Board.count}.by(-1)
    end
  end

  describe "PUT update" do
    let(:params) {{id: board.id, title: 'Title updated'}}
    let(:call) {put :update, id: board.id, board: params}
    it "updates title" do
      expect {call}.to change {board.reload.title}.to('Title updated')
    end
  end

  describe "POST create" do
    let(:params) {{board: { title: 'New title 123'}}}
    let(:call) {post :create, params}

    it "creates new board" do
      expect {call}.to change {Board.count}.by(1)
    end
  end

  describe "POST create" do
    let(:params) {{board: { title: 'New title 123'}}}
    let(:call) {post :create, params}
    
    it "assigns owner" do
      call
      expect(Board.last.owner).to eq(user)
    end
  end
end