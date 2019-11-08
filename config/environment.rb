# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
# Add the needed requirement to boot the app
require 'bundler/setup'
require 'rubygems'
require 'data_mapper'
Bundler.require(:default, ENV['SINATRA_ENV'])

# Setting DataMapper database connection
# Having trouble with database or you want to change the adapter ?! check https://datamapper.org/getting-started.html
DataMapper.setup(:default, 'postgres://klarx_user:klarxpass@127.0.0.1:5432/klarx_db')
# Loading all the files in app folder
require_all 'app'
