class Invitation < ActiveRecord::Base
  belongs_to :board
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  before_create :generate_token

  def generate_token
     self.token = SecureRandom.uuid
  end
end