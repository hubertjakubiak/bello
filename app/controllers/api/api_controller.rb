module Api
  class ApiController < ActionController::Base
    def default_serializer_options
      { root: false }
    end
  end
end