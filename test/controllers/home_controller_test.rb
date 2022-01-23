# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    create(:doorkeeper_application)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end
end
