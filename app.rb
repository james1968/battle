require 'sinatra/base'

class Battle < Sinatra::Base

  set :sessions, true
  set :logging, true

  get '/' do
    erb :index
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end

  post '/names' do
    p params
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
