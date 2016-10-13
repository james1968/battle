require_relative 'turn'

class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(player_1, player_2, turn=Turn)
    @player_1 = player_1
    @player_2 = player_2
    @turn = turn.new(player_1, player_2)
  end

  def attack
    player_receiving_damage.reduce_health
  end

  def player_receiving_damage
    if @turn.current_turn == @player_2
      @player_1
    else
      @player_2
    end
  end

  def game_over?
    @player_1.hit_points <=0 || @player_2.hit_points <=0
  end

  def loser
    fail unless game_over?
    if @player_1.hit_points <=0
      @player_1
    elsif @player_2.hit_points <=0
      @player_2
    end
  end


end
