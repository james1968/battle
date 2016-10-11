require 'player'

describe Player do

  subject (:mittens) {Player.new('Mittens')}

    describe '#name' do
      it 'returns the name' do
      expect(subject.name).to eq "Mittens"
    end
  end
end
