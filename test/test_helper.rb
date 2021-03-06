ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rails/capybara'

Capybara.javascript_driver = :webkit

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  DatabaseCleaner.strategy = :transaction

  before do
    DatabaseCleaner.start
    Rake::Task["db:seed"].invoke # seed after starting
  end

  after do
    DatabaseCleaner.clean
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

 # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end

  # Add more helper methods to be used by all tests here...
end
