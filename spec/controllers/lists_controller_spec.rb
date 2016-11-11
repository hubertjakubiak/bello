require "rails_helper"

describe ListsController do

  before {sign_in}

  describe "GET new" do
    let(:board) {create(:board)}
    it "renders the new template" do
      get :new, board_id: board.id
      expect(response).to render_template(:new)
    end
  end

  describe "GET edit" do
    let(:board) {create(:board)}
    let(:list) {create(:list, board: board)}
    it "renders the edit template" do
      get :edit, board_id: board.id, id: list.id
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE destroy" do
    let!(:board) {create(:board)}
    let!(:list) {create(:list, board: board)}
    let(:call) {delete :destroy, board_id: board.id, id: list.id}
    it "delete existing list" do
      expect {call}.to change {List.count}.by(-1)
    end
  end

  describe "PUT update" do
    let(:board) {create(:board)}
    let(:list) {create(:list, board: board)}
    let(:params) {{board_id: board.id, id: list.id, title: 'Title updated'}}
    let(:call) {put :update, board_id: board.id, id: list.id, list: params}
    it "updates title" do
      expect {call}.to change {list.reload.title}.to('Title updated')
    end
  end

  describe "POST create" do
    let(:board) {create(:board)}
    let(:params) {{board_id: board.id, list: { title: 'New title'}}}
    let(:call) {post :create, params}
    it "create new list" do
      expect {call}.to change {List.count}.by(1)
    end
  end
end