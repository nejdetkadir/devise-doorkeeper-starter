module Users
  class DeviseController < ApplicationController
    class Responder < ActionController::Responder
      # rubocop:disable Style/GuardClause
      def to_turbo_stream
        controller.render(options.merge(formats: :html))
      rescue ActionView::MissingTemplate => e
        if get?
          raise e
        elsif has_errors? && default_action
          render rendering_options.merge(formats: :html, status: :unprocessable_entity)
        else
          redirect_to navigation_location
        end
      end
      # rubocop:enable Style/GuardClause
    end

    self.responder = Responder
    respond_to :html, :turbo_stream
  end
end
