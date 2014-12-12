require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative  'config/environments.rb'

get '/' do
	return erb :index
end