# loading the app
require File.join(File.dirname(__FILE__), '..', 'config/environment')
# requiring test gems
require 'rack/test'
require 'rspec'
# setting env
set :environment, :test

# Set testing environment with a different db
# Here we use the same credentials for testing
DataMapper.setup(:default, 'postgres://klarx_user:klarxpass@127.0.0.1:5432/klarx_test')

# Creating a Mixin
module RSpecMixin
  include Rack::Test::Methods
  def app() ApplicationController end
end

RSpec.configure { |c| c.include RSpecMixin }