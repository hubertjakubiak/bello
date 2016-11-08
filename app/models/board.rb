class Board < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :members
  has_many :users, through: :members
  has_many :lists, dependent: :destroy
end