require 'player'

describe Player do
  subject(:trump) {described_class.new("Trump")}
  subject(:corbyn) {described_class.new("Corbyn")}

  context 'When the player initializes' do
    describe '#initialize' do
      it 'receives the player name from the app controller' do
         expect(corbyn.name).to eq 'Corbyn'
      end

      it 'has 100 hit points' do
        expect(corbyn.hp).to eq Player::STARTING_HP
      end
    end
  end
  context 'HP changes' do
    describe '#receive_damage' do
      it 'deducts hp points from player' do
        allow(Kernel).to receive(:rand).and_return(10)
        expect{corbyn.receive_damage}.to change {corbyn.hp}.by(-10)
      end
    end
  end
end
