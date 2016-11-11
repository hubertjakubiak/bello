require "rails_helper"

describe User do

  describe 'associations' do
    it {is_expected.to have_many :ownerships}
    it {is_expected.to have_many :tasks}
    it {is_expected.to have_many :memberships}
    it {is_expected.to have_many(:boards).through(:memberships)}
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :name }
    it {is_expected.to validate_presence_of :email }
    it {is_expected.to validate_presence_of :password }
    it {is_expected.to validate_uniqueness_of :email }
  end

  describe 'database columns' do
    it { should have_db_column :name }
    it { should have_db_column :email }
    it { should have_db_column :password_digest }
  end
end