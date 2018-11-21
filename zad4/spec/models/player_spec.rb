# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  subject(:player) { build(:player) }

  %i[first_name last_name].each do |attr|
    it { is_expected.to be_valid }
    it "is not valid without #{attr}" do
      subject.assign_attributes(attr => nil)
      expect(subject).not_to be_valid
    end
  end

  context 'with level below 0' do
    it 'is not to valid' do
      player.power = -1
      expect(player).not_to be_valid
    end
  end

  context 'with power above 99' do
    it 'is not valid' do
      player.power = 100
      expect(player).not_to be valid
    end
  end

  context 'with power between 0 and 99' do
    it 'is valid' do
      expect(player).to be_valid
    end
  end

  context 'when power equals 0' do
    it 'is valid' do
      player.power = 0
      expect(player).to be_valid
    end
  end

  context 'when power equals 99' do
    it 'is valid' do
      player.power = 99
      expect(player).to be_valid
    end
  end
end
