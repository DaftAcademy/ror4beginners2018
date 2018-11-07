##
# This class represents basic character in game containing must have values to define single identity
class Character

  ##
  # Allows the user to identify the created character during the program runtime
  attr_accessor :name

  ##
  # Level defines the character level but is also used as it's base damge value
  attr_accessor :level

  def initialize(name, level)
    self.name = name
    self.level = level
  end

  ##
  # Strength is used to calculate character 'power' during the fight it sums character lv and rolls d12
  def strength
    level + [*1..12].sample
  end

end




class Warrior
  def initialize(name:, level:)
  end

  def strength
  end
end

class BattleArena
  def initialize(first_character, second_character)
  end
end
