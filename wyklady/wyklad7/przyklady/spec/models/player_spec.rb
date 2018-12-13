require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'has power' do
    player = build(:player)
    expect(player.power).to eq 50
  end

  it 'is not valid' do
    expect(Player.new).not_to be_valid
  end

  it 'costam' do
    expect('something').to eq 'something'
  end

  describe '#powerful_captain?' do
    context 'with powerful player' do
      let(:player) { build(:player, :powerful_captain) }

      it 'is true' do
        expect(player.powerful_captain?).to eq(true)
      end

      it 'is false for updated player' do
        player.power = 50
        expect(player.powerful_captain?).to eq(false)
      end
    end

    context 'with weak player' do
      it 'is false' do
        player = Player.new(power: 50)
        expect(player.powerful_captain?).to eq(false)
      end
    end
  end

  describe '.stronger_than' do
    let(:players) { create_list(:player, 5) }

    before { players }

    context 'when we call players stronger 51' do
      it 'is empty' do
        expect(Player.stronger_than(51)).to be_empty
      end
    end

    context 'when call players stronger than 49' do
      it 'returns players' do
        expect(Player.stronger_than(49)).to eq(players)
      end
    end
  end
end
