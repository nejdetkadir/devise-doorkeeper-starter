ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "helpers/doorkeeper_params"

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include Helpers::DoorkeeperParams

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
