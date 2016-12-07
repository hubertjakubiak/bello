module Api
  module V1
    class BoardSerializer < ActiveModel::Serializer
      attributes :id, :title
      has_many :lists, serializer: ListSerializer
    end
  end
end