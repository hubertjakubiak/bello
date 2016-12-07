module Api
  module V1
    class ListSerializer < ActiveModel::Serializer
      attributes :id, :title, :total

      def total
        object.id + 10
      end
    end
  end
end