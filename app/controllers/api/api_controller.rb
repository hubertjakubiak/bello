module Api
  class ApiController < ActionController::Base
    include Knock::Authenticable
    def default_serializer_options
      { root: false }
    end
  end
end