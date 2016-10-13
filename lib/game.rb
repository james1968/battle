require_relative 'player'

class Game

  attr_reader :players, :current_player, :opponent

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = @players.first
    @opponent = opponent_of(current_player)
  end

  def attack(player)
    player.receive_damage
  end

  def switch_player
    @current_player = opponent_of(current_player)
    @opponent = opponent_of(opponent)
  end

  def loser
    @players.select { |player| player.hit_points <=0 }.first
  end

  def game_over?
    !loser.nil?
  end

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

end
