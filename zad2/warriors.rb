class Character
	attr_reader :name
	attr_reader :level
	def initialize(name:,level:)
		@name=name
		@level=[[level,1].max,99].min
	end
	def strength
		@level+[*1..12].sample
	end

	def card
		"#{@name} (lvl #{@level})"
	end

end

class Warrior < Character
	def level_up(level)
		@level=[@level+level,99].min
	end
end

class Monster < Character
end

class BattleArena
	def initialize(first_character, second_character)
		@first_character=first_character
		@second_character=second_character
	end

	def alert(first,second,strength)
		puts "#{first.name} attacked #{second.name} with #{strength} damage" 
	end

	def winner(character,level)
		puts "Won #{character.name}"
		if character.is_a? Warrior && level>0
			character.level_up(level)
		end	
		
	end

	def battle!
		first_strength=@first_character.strength
		second_strength=@second_character.strength
		alert(@first_character,@second_character,first_strength)
		alert(@second_character,@first_character,second_strength)
		
		if first_strength>second_strength
			winner(@first_character,@second_character.level-@first_character.level+1)
		elsif first_strength<second_strength
			winner(@second_character,@first_character.level-@second_character.level+1)
		else
			puts "Draw"
		end
	end
end
