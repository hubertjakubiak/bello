require "rails_helper"

describe List do
  describe 'associations' do
    it {is_expected.to belong_to :board}
    it {is_expected.to belong_to :user}
  end

  describe 'database columns' do
    it { should have_db_column :user_id }
    it { should have_db_column :board_id }
  end
end