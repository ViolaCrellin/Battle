require 'game'

describe Game do
  let(:corbyn) { double :corbyn }
  let(:trump) { double :trump }
  subject(:game) { described_class.new(corbyn, trump) }

  describe 'initialize' do
    it 'initializes with two players' do
      expect(game.p1).to eq corbyn
      expect(game.p2).to eq trump
    end
  end

  describe "#player_one_attacks" do

    before do
      allow(corbyn).to receive(:dead?).and_return false
    end

    it 'checks player one isn\'t dead before attacking' do
      allow(trump).to receive(:receive_damage)
      expect(corbyn).to receive(:dead?)
      game.player_one_attacks
    end

    it 'attacks player 2' do
      expect(trump).to receive(:receive_damage)
      game.player_one_attacks
    end

    it "doesn't attack when not even turn" do
      allow(trump).to receive(:receive_damage)
      game.player_one_attacks
      expect(trump).to_not receive(:receive_damage)
      game.player_one_attacks
    end
  end

  describe "#player_two_attacks" do


    it 'attacks player 1' do
      expect(trump).to receive(:receive_damage)
      allow(corbyn).to receive(:dead?).and_return false
      game.player_one_attacks
      expect(corbyn).to receive(:receive_damage)
      allow(trump).to receive(:dead?).and_return false
      game.player_two_attacks
    end

    it "doesn't attack when not odd turn" do
      allow(corbyn).to receive(:receive_damage)
      game.player_two_attacks
      expect(corbyn).to_not receive(:receive_damage)
      game.player_two_attacks
    end


  end
end
