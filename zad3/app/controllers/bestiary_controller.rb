# frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
    require monsters
    create table :Monsters 
      for &:monsters do 
        "#{id}".integer :ID
        "#{name}".string :Name
        "#{location}".string :Location
        "#{best_slayer}".string :Best_slayer
      end
    end
  end

  def novigrad_monsters

  end

  def welcome
    @random = rand(100)
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
