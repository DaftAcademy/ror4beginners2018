# frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
    @index = monsters
  end

  def novigrad_monsters
    @novigrad_monsters = monsters.keep_if {|i| i[:location]=='Novigrad'}
  end

  private

  def monsters
    @monsters ||= begin
      Faker::Config.random = Random.new(1822)
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
