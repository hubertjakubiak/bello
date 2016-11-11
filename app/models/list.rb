class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :board
  belongs_to :user

  validates_presence_of :title
end