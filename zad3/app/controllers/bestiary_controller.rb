# frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
    monsters
  end

  def novigrad_monsters
    @monsters = monsters.select(&from?("novigrad"))
  end

  private

  def from? location
    Proc.new {|character| character.delete(:location).downcase.eql?(location)}
  end

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
