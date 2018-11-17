#frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
	monsters
	@table = "<tr><th>ID</th><th>Name</th><th>Location</th><th>Best slayer</th></tr>".html_safe
	for monster in @monsters
		@monster_attributes = "<tr><th>#{monster[:id]}</th><th>#{monster[:name]}</th><th>#{monster[:location]}</th><th>#{monster[:best_slayer]}</th></tr>".html_safe
		@table =   @table + @monster_attributes
	end
  end

  def novigrad_monsters
	monsters
	@novigrad_monster = "<tr><th>ID</th><th>Name</th><th>Location</th><th>Best slayer</th></tr>".html_safe
	for monster in @monsters
		if monster[:location] == "Novigrad"
			@monster_attributes = "<tr><th>#{monster[:id]}</th><th>#{monster[:name]}</th><th>#{monster[:location]}</th><th>#{monster[:best_slayer]}</th></tr>".html_safe
			@novigrad_monster =   @novigrad_monster + @monster_attributes
		end
	end
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
