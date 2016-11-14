require "rails_helper"

describe Board do
  describe 'associations' do
    it {is_expected.to belong_to :owner}
    it {is_expected.to have_many :lists}
    it {is_expected.to have_many :memberships}
    it {is_expected.to have_many(:members).through(:memberships)}
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :title }
    it {is_expected.to validate_presence_of :owner }
  end

  describe 'database columns' do
    it { should have_db_column :title }
  end
end