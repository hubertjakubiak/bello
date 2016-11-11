class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates_presence_of :body
end