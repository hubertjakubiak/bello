require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :list } 
  end
end
