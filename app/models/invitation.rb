class Invitation < ActiveRecord::Base
  EMAIL_REGEXP = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/

  belongs_to :board
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  before_create :generate_token

  validates :email, format: { with: EMAIL_REGEXP }
  validates :token, uniqueness: true

  def generate_token
     self.token = SecureRandom.uuid
  end

  # def generate_token
  #   update!(token: SecureRandom.uuid)
  # rescue
  #   generate_token
  # end
end