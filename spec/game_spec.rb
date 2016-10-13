require 'spec_helper'
require 'player'
require 'game'

describe Game do
  let(:player_1) { Player.new("Sally") }
  let(:player_2) { Player.new("Claire") }
  subject { described_class.new(player_1, player_2) }

  describe 'attack' do
    it "should reduce hit points if you click attack" do
      expect{subject.attack}.to change{subject.player_2.hit_points}.by(-10)
    end
  end

  describe 'game_over' do
    it "should know when the game is over" do
      dead_player = Player.new("Zombie", 0)
      game = described_class.new(player_1, dead_player)
      expect(subject.gave_over?).to be true
    end
  end

end
