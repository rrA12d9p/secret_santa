require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative  'config/environments.rb'

get '/' do
	return erb :index
end