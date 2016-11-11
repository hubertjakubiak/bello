require "rails_helper"

describe Task do
  describe 'associations' do
    it {is_expected.to belong_to :list}
    it {is_expected.to belong_to :user}
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :body }
  end

  describe 'database columns' do
    it { should have_db_column :body }
  end
end