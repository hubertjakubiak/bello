class Board < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :lists, dependent: :destroy
  has_many :memberships
  has_many :members, through: :memberships, source: :user

  validates_presence_of :title
end