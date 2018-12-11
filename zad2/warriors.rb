class Character
  attr_accessor :name, :level
  

  def initialize(name:, level:)
    @name = name
    @level = level <= 99 ? level : 1
  end

  def strength
    [*1..12].sample + @level
  end

  def card
    puts "#{@name} (lvl #{@level})"
  end

end


class Warrior < Character

  def level_up(opponent) 
    if @level == opponent.level
      @level = @level + 1 <= 99 ? @level + 1 : 99

    elsif @level < opponent.level
      lvlup = @level + (opponent.level - @level)
      @level = lvlup <= 99 ? lvlup : 99
    end

  end

end

class Monster < Character
end


class BattleArena
  attr_accessor :name, :level
  
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_character_strength = @first_character.strength
    second_character_strength = @second_character.strength

    puts "#{@first_character.name} attacked #{@second_character.name} with #{first_character_strength}"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{second_character_strength}"

    if first_character_strength > second_character_strength
      puts "#{@first_character.name} won"
      add_level(@first_character, @second_character)

    elsif first_character_strength < second_character_strength
      puts "#{@second_character.name} won"
      add_level(@second_character, @first_character)

    else
      puts "Draw!"
    end

  end

  def add_level(character1, character2)
    (character1.is_a? Warrior) ? character1.level_up(character2) : nil
  end
end
