# frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
    @var = monsters
  end

  def novigrad_monsters
    @var = monsters.select! { |creature| creature[:location] == 'Novigrad'}
  end

  private

  def monsters
    @monsters ||= begin
      Faker::Config.random = Random.new(42)
      (0..20).map do |n|
        {
          id: n,
          name: Faker::Witcher.monster,
          location: Faker::Witcher.location,
          best_slayer: Faker::Witcher.character
        }
      end
    end
  end
end
