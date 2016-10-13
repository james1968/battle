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

  post '/names_computer' do
    player_1 = Player.new(params[:player_one_name])
    player_2 = Player.new(params[:player_two_name] + " (the Computer)")
    Game.create(player_1, player_2)
    redirect '/play_computer'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  get '/play_computer' do
    erb(:human_turn)
  end

  get '/attack' do
    @game.attack
    redirect '/end' if @game.game_over?
    erb(:attack)
  end

  get '/attack_computer' do
    @game.attack
    redirect '/end' if @game.game_over?
    erb(:attack_computer)
  end

  get '/attack_human' do
    @game.attack
    redirect '/end' if @game.game_over?
    erb(:attack_human)
  end

  get '/computer_turn' do
    erb(:computer_turn)
  end

  post '/switch_turn' do
    @game.turn.switch_turn
    redirect '/play'
  end

  post '/switch_turn_computer' do
    @game.turn.switch_turn
    redirect '/computer_turn'
  end

  post '/switch_turn_human' do
    @game.turn.switch_turn
    redirect '/play_computer'
  end


  get '/end' do
    erb(:end)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
