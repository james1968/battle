require_relative 'player'

class Game

  attr_reader :current_player, :game_over, :loser

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
  end

  def attack(player)
    player.receive_damage
  end

  def opponent
    opponent_of(current_player)
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turns
    @current_player = opponent_of(current_player)
  end

  def loser
    @players.select { |player| player.hit_points <= 0}.first
  end

  def game_over?
    !loser.nil?
  end

  private

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

end
