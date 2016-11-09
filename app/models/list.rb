class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :board
  belongs_to :user
end