require 'game'

describe Game do
  subject(:game) { described_class.new(dave, mittens) }
  let(:dave) { double :player }
  let(:mittens) { double :player }

  describe '#attack' do
    it 'damages the player' do
      expect(mittens).to receive(:receive_damage)
      game.attack(mittens)
    end
  end

  describe '#player_1' do
    it 'accetps new player instance' do
      expect(game.player_1).to eq dave
    end
  end

  describe '#player_2' do
    it 'accetps new player instance' do
      expect(game.player_2).to eq mittens
    end
  end
  
end
