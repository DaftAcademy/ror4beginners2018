# frozen_string_literal: true

class BestiaryController < ApplicationController

  attr_internal :monster

  def index
    begin
    @monster = Array.new
    Potwor.destroy_all
      monsters.each {|f|  @monster.push(Potwor.new(f))}
      @monster.each {|f| f.save}
    
    rescue
    @monster =Potwor.all
    end
  
  end

  

  def novigrad_monsters
    #@monster = Array.new
    @monster = Potwor.where( location: 'Novigrad')

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
