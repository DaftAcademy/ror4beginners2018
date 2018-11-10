class Character
  attr_reader :level
  attr_reader :name

  def initialize(name:, level:)
	@name = name
	@level = level
  end

  def card 
	"#{@name} (lvl #{@level})"
  end

  def strength
	@level + [*1..12].sample
  end
  
end


class Warrior < Character
	attr_writer :level

end

class Monster < Character

end

class BattleArena

  def initialize(first_character, second_character)
  @first_character = first_character
  @second_character = second_character
  end

  def battle!
  first_damage = @first_character.strength
  puts "#{@first_character.name} attacked #{@second_character.name} with #{first_damage} damage"

  second_damage = @second_character.strength
  puts "#{@second_character.name} attacked #{@first_character.name} with #{second_damage} damage"

  winner = (first_damage>second_damage) ? @first_character : @second_character
  loser = (first_damage<second_damage) ? @first_character : @second_character
  puts "#{winner.name} won"

  if winner.is_a? Warrior
    unless loser.level < winner.level
      winner.level = winner.level + (loser.level - winner.level) + 1
    end 
  end
  
  end

end