class User < ActiveRecord::Base
  has_secure_password

  has_many :ownerships, foreign_key: :owner_id, class_name: 'Board', dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :memberships
  has_many :member_boards, through: :memberships, source: :board

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
