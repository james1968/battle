require_relative 'turn'
require_relative 'attack'

class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(player_1, player_2, turn=Turn)
    @player_1 = player_1
    @player_2 = player_2
    @turn = turn.new(player_1, player_2)
    @attack = Attack.new(player_1, player_2, @turn.current_turn)
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def attack
    @attack.attack
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
