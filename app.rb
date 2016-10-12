require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  use Rack::Session::Cookie,:key => 'rack.session',
                            :path => '/',
                            :secret => 'your_secret'

  get '/' do
    erb :index
  end

  get '/play' do
    @game = $game
    if @game.game_over?
      redirect 'game_over'
    else
      erb :play
    end
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent)
    erb :attack
  end

  post '/switch_turns' do
    $game.switch_turns
    redirect('/play')
  end

  get '/game_over' do
    @game = $game
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
