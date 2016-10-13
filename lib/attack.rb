
class Attack

  def initialize(player_1, player_2, current_turn)
    @current_turn = current_turn
    @player_1 = player_1
    @player_2 = player_2
  end

  def attack
    player_receiving_damage.reduce_health
  end

  def player_receiving_damage
    if @current_turn == @player_2
      @player_1
    else
      @player_2
    end
  end

end
