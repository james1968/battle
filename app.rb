require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_one_name])
    player_2 = Player.new(params[:player_two_name])
    Game.create(player_1, player_2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.attack
    redirect '/end' if @game.game_over?
    erb(:attack)
  end

  post '/switch_turn' do
    @game.turn.switch_turn
    redirect '/play'
  end

  get '/end' do
    erb(:end)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
