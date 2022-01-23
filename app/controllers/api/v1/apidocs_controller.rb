# frozen_string_literal: true

module Api
  module V1
    class ApidocsController < ApiController
      skip_before_action :doorkeeper_authorize!

      include Swagger::Blocks

      swagger_root do
        key :swagger, '2.0'

        info do
          key :version, '1.0.0'
          key :title, 'Devise + Doorkeeper Starter'
          key :description, 'Devise + Doorkeeper Starter API documentation'

          contact do
            key :name, 'Devise + Doorkeeper Starter'
            key :url, 'https://devise-doorkeeper-starter.herokuapp.com'
            key :email, 'nejdetkadir.550@gmail.com'
          end
        end

        key :host, Rails.env.development? ? 'localhost:3000' : 'https://devise-doorkeeper-starter.herokuapp.com'
        key :basePath, '/api/v1'
        key :consumes, ['application/json']
        key :produces, ['application/json']
        key :schemes,  [Rails.env.development? ? 'http' : 'https']
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
        self
      ].freeze

      def index
        render html: nil, layout: 'swagger'
      end

      def data
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
