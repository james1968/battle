class Turn

  attr_reader :current_turn

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [@player_1, @player_2]
    @current_turn = @players.first
  end

  def switch_turn
    @players = @players.reverse
    @current_turn = @players.first
  end
end
