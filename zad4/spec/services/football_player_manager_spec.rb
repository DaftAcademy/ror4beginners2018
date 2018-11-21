# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FootballPlayerManager do
  subject(:service) { described_class.new(player) }
  let(:player) { create(:player, power: 20) }

  describe '#stronger_players' do
    let(:other_player) { create(:player, power: 100) }

    before { other_player }

    it 'returns array with stronger player' do
      expect(service.stronger_players).to include(other_player)
    end
  end

  describe '#set_power' do
    let(:new_power) { 40 }

    before { service.set_power(new_power) }

    it 'sets player power to new power' do
      expect(player.reload.power).to eq(new_power)
    end
  end

  describe '#copy_player' do
    it 'creates new player' do
      expect { service.copy_player }.to change(Player, :count).by(1)
    end

    it 'sets same first name for a new player' do
      expect(service.copy_player.first_name).to eq(player.first_name)
    end

    it 'sets same last name for a new player' do
      expect(service.copy_player.last_name).to eq(player.last_name)
    end

    it 'sets same power for a new player' do
      expect(service.copy_player.power).to eq(player.power)
    end
  end
end
