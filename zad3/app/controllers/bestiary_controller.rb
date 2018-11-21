# frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
    @monsters = monsters
  end

  def novigrad_monsters
    @novigrad_monsters = monsters_from('Novigrad')
  end

  private

  def monsters
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

  def monsters_from(location)
    monsters.select do |monster|
      monster[:location] == location
    end
  end
end
