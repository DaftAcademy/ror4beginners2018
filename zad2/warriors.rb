class Character

attr_accessor :name
attr_accessor :level

  def initialize(name:, level:)
  	@level = level
  	@name = name
  end

  def strength
  	@level + [*1..12].sample
  end

  def card
  	"#{@name} (lvl #{@level})"
  end
end

class Warrior < Character
	def levelup(opponent_level)
		@level += opponent_level-@level+1 if @level <=opponent_level
		@level = 99 if @level >99
	end
end

class Monster < Character
end


class BattleArena
  def initialize(first_character, second_character)
  	@first_character = first_character
  	@second_character = second_character
  end

  def battle!
  	puts "#{@first_character.name} attacked #{@second_character.name} with #{strength1 = @first_character.strength} damage."
  	puts "#{@second_character.name} attacked #{@first_character.name} with #{strength2 = @second_character.strength} damage."

  	if strength1 > strength2 then
  		puts "#{@first_character.name} won" 
  		@first_character.levelup(@second_character.level) if @first_character.is_a? Warrior
  	elsif strength2 > strength1 then
  		puts "#{@second_character.name} won"
  		@second_character.levelup(@first_character.level) if @second_character.is_a? Warrior
  	else
  		puts "Draw!"
  	end
  end

  			
end
