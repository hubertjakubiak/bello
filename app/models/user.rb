class User < ActiveRecord::Base
  has_secure_password

  has_many :ownerships, foreign_key: :owner_id, class_name: 'Board'
  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :members
  has_many :boards, through: :members
end
