require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative  'config/environments.rb'

require_relative "./models/user"
require_relative "./models/gift"

enable :sessions

before do
	session[:user] ||= []
	path_no_base = request.url.gsub(request.base_url, '')
  if session[:user].empty? && path_no_base != "/login" && path_no_base != "/signup"
    redirect "/login"
  end
end

get '/' do
	return erb :index
end

get '/login' do
	return erb :login
end

post "/login" do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)
  user_exists = (user != nil)
  
  if user_exists && user.authenticate(password)
    session[:user] = {id: user.id, email: email}
    redirect "/"
  end
  
  redirect "/login"
end

get "/logout" do
  session.clear
  redirect '/'
end

post "/signup" do
  email = params[:email]
  password = params[:password]

  puts "HERE #{params.inspect}"

  user = User.new(email: email, password: password)

  if user.save
  	session[:user] = {id: user.id, email: email}
 		redirect "/"
  else
  	@errors = user.errors.full_messages
  	puts @errors
  end

  
end
