require 'spec_helper'
require 'turn'

describe Turn do
  let(:player_1) { double(:player) }
  let(:player_2) { double(:player) }
  subject { described_class.new(player_1, player_2) }

  it "initialises with player 1 turn" do
    expect(subject.current_turn).to be player_1
  end

  it {is_expected.to respond_to :switch_turn}

  describe "switch_turn" do
    it "changes player_2 when it is player 2's turn" do
      expect{subject.switch_turn}.to change{subject.current_turn}.to(player_2)
    end
  end

end
