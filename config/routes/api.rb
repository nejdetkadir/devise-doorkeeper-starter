# frozen_string_literal: true

namespace :api do
  namespace :v1 do
    # Swagger documentation
    scope :swagger do
      get '/', to: 'apidocs#index', as: 'swagger_root'
      get '/data', to: 'apidocs#data', as: 'swagger_data'
    end
  end
end
