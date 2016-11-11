require "rails_helper"

describe List do
  describe 'associations' do
    it {is_expected.to belong_to :board}
    it {is_expected.to belong_to :user}
    it {is_expected.to have_many :tasks}
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :title }
  end

  describe 'database columns' do
    it { should have_db_column :title }
  end
end