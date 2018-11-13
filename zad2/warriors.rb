class Character
  attr_reader :level

  def initialize(name:, level:)
    unless level.between? @@MIN_LEVEL, @@MAX_LEVEL 
      raise ArgumentError, "Level should be in range [#@@MIN_LEVEL, #@@MAX_LEVEL]"
    end

    @name = name
    @level = level
  end

  def strength
    @level + roll_dice
  end

  def card
    "#@name (lvl #@level)"
  end

  def to_s
    @name
  end

  protected

  @@MIN_LEVEL = 1
  @@MAX_LEVEL = 99

  private

  @@DICE_SIZE = 12

  def roll_dice
    [*1..@@DICE_SIZE].sample
  end
end

class Warrior < Character
  def level_up!(opponent)
    level_increase = [0, opponent.level - @level + 1].max
    new_level = [@level + level_increase, @@MAX_LEVEL].min
    if new_level > level
      puts "#{self}'s level increases from #@level to #{new_level}"
      @level = new_level
    end
  end
end

class Monster < Character
  def level_up!(opponent)
    # do nothing
  end
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_strength = @first_character.strength
    puts "#@first_character attacked #@second_character with #{first_strength} damage"

    second_strength = @second_character.strength
    puts "#@second_character attacked #@first_character with #{second_strength} damage"

    if first_strength > second_strength
      puts "#@first_character won"
      @first_character.level_up!(@second_character)
    elsif second_strength > first_strength
      puts "#@second_character won"
      @second_character.level_up!(@first_character)
    else
      puts "There was a draw"
    end
  end
end
