##
# This class represents basic character in game containing must have values to define single identity
class Character

  ##
  # Allows the user to identify the created character during the program runtime
  attr_accessor :name

  ##
  # Level defines the character level but is also used as it's base damge value
  attr_reader :level

  def initialize(name: nil, level: nil)
    @name = name
    @level = level_valid?(level)
  end

  ##
  # Strength is used to calculate character 'power' during the fight it sums character lv and rolls d12
  def strength
    level + [*1..12].sample
  end

  def level=(new_level)
    @level = level_valid?(new_level)
  end

  ##
  # Card returns a short description of character
  def card
    "This is #{@name} he is #{Character.to_s} with level: #{@level}."
  end

  protected

  # Defines min level character can have
  def self.MIN_LEVEL
    1
  end

  # Defines max level character can have
  def self.MAX_LEVEL
    99
  end

  ##
  # Checks if level is valid by first checking if its in described range and if not and var was nil asings MIN_LEVEL as starter level
  def level_valid?(new_level)
    new_level.between?(Character.MIN_LEVEL, Character.MAX_LEVEL) ? new_level : @level ||= Character.MIN_LEVEL
  end

end



class Warrior < Character
  def initialize(name: nil, level: nil)
    super(name: name, level: level)
  end

end

class Monster < Character
  def initialize(name: nil, level: nil)
    super(name: name, level: level)
  end

end

class BattleArena
  def initialize(first_character, second_character)
  end
end
