load "character.rb"

class Warrior < Character
  def initialize(params = {})
    super(params.fetch(:name, Faker::Name.name), params.fetch(:level, 1))
  end

  def levelUp enemy_level
    @level = enemy_level + 1 if enemy_level >= @level
  end
end