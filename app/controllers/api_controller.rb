class ApiController < ApplicationController
  # equivalent of authenticate_user! on devise, but this one will check the oauth token
  before_action :doorkeeper_authorize!

  # Skip checking CSRF token
  skip_before_action :verify_authenticity_token

  # Set response type
  respond_to :json

  private

  # helper method to access the current user from the token
  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
  end
end
