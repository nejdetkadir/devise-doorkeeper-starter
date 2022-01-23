# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @application = Doorkeeper::Application.first

    @application = {
      client_id: @application.uid,
      client_secret: @application.secret
    }
  end
end
