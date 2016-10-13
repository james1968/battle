require 'spec_helper'
require 'player'
require 'game'

describe Game do
  let(:player_1) { Player.new("Sally") }
  let(:player_2) { Player.new("Claire") }
  subject { described_class.new(player_1, player_2) }

  describe 'game_over' do
    it "should know when the game is over" do
      dead_player = Player.new("Zombie", 0)
      game = described_class.new(player_1, dead_player)
      expect(game.game_over?).to be true
    end
  end

  describe 'loser' do
    it "should know the losing player" do
      dead_player = Player.new("Zombie", 0)
      game = described_class.new(player_1, dead_player)
      expect(game.loser).to eq dead_player
    end
  end


end
