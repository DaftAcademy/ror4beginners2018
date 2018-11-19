
class Character
	attr_accessor :name
	attr_accessor :level

	def initialize name, level
		raise TypeError unless name.is_a? String
		raise TypeError unless level.is_a? Integer and level.between?(1,99)
		@name = name
		@level = level
	end

	def strength
		@level + [*1..12].sample
	end

	def card
		[@name, @level].join(', level ')
	end
end

class Monster < Character

end

class Warrior < Character
	def level_up(foe)
		if foe.level == @level
			@level = @level + 1
		elsif foe.level > @level
			@level = foe.level
		end
		if level > 99
			level = 99
		end
	end
end

class BattleArena
	attr_accessor :first_character
	attr_accessor :second_character

	def initialize first_character, second_character
		@first_character = first_character
		@second_character = second_character
	end

	def battle!
		dmg1 = @first_character.strength()
		dmg2 = @second_character.strength()
		puts("#{first_character.card} attacked #{second_character.card} with #{dmg1} damage.")
		puts("#{second_character.card} attacked #{first_character.card} with #{dmg2} damage.")
		if dmg1 > dmg2
			winner = @first_character
			loser = @second_character
			puts("#{winner.card} won.")
		elsif dmg1 < dmg2
			winner = @second_character
			loser = @first_character
			puts("#{winner.card} won.")
		else
			puts("Draw.")
			winner = nil
		end

		if winner.is_a? Warrior
			winner.level_up(loser)
		end
	end
end