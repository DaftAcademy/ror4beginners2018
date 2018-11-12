class Character
	attr_reader :name
	attr_accessor :level

	def initialize(name, level) 
		@name = (name.is_a? String) ? name : "NoName Hero"
		@level = ((level.is_a? Integer) && (level < 100)) ? level : 1
	end

	def card
		p "#{name} (lvl #{level})"
	end

	def strength
  		level + [*1..12].sample
  	end
end

class Warrior < Character
  	def initialize(name, level)
  		super(name, level)
  	end  	
end

class Monster < Character
	def initialize(name, level)
  		super(name, level)
  	end
end

class BattleArena
	attr_accessor :first_character, :second_character

	def initialize(first_character, second_character)
		@first_character = first_character
		@second_character = second_character
	end

	def battle!
		damage1 = first_character.strength
		damage2 = second_character.strength
		p "#{first_character.name} attacked #{second_character.name} with #{damage1} damage"
		p "#{second_character.name} attacked #{first_character.name} with #{damage2}"

		if first_character.level > second_character.level
			upgrade1 = first_character.level + 1
			upgrade2 = second_character.level + 1 + (first_character.level - second_character.level)
		elsif first_character.level < second_character.level
			upgrade1 = first_character.level + 1 + (second_character.level - first_character.level)
			upgrade2 = second_character.level + 1
		else
			upgrade1 = first_character.level + 1
			upgrade2 = second_character.level + 1
		end

		if damage1 > damage2
			if first_character.is_a? Warrior
				first_character.level = (upgrade1 <= 99 ? upgrade1 : 99)
			end			
			p "#{first_character.name} won!!"
			first_character.card
			second_character.card
		elsif damage1 < damage2
			if second_character.is_a? Warrior
				second_character.level = (upgrade2 <= 99 ? upgrade2 : 99)
			end
			p "#{second_character.name} won!!"
			first_character.card
			second_character.card
		else 
			p "Incredible battle, but still unsolved! Try one more time."
			first_character.card
			second_character.card
		end
	end 

end

warrior1 = Warrior.new("Jackie Chan", 10)
warrior2 = Warrior.new("Seba", 1)
monster1 = Monster.new("Buka", 12)

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
arena.battle!

arena2 = BattleArena.new(warrior1, monster1)
arena2.battle!
arena2.battle!
