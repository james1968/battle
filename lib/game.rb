require_relative 'player'

class Game

  attr_reader :current_player

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

  private

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

end
