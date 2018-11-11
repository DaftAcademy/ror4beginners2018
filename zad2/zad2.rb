class Character
	
	attr_reader :name, :level
	
	def initialize(name:, level:)
		@name = name
		@level = level
	end
	
	 def card
		return "#{@name}  (lvl #{@level})" 
	end
end

class Warrior < Character
  def strength
		return [*1..12].sample+@level
  end
  def level_up(enemy_level)
		@level=enemy_level + 1
  end
end

class Monster < Character
	def strength
		return @level
  end
end

class BattleArena
	attr_accessor :first_character, :second_character
	
  def initialize(first_character, second_character)
		self.first_character = first_character
		self.second_character = second_character
  end
  
  def  battle_score(winner,loser)
		puts "#{winner.name} won!"		
		if winner.is_a? Warrior and winner.level<=loser.level
			winner.level_up(loser.level)
		end
  end
  
  def battle!
		first_character_strength = first_character.strength
		second_character_strength = second_character.strength
		
		puts "#{first_character.name} attacked #{second_character.name} with #{first_character_strength} damage"
		puts "#{second_character.name}  attacked #{first_character.name} with #{second_character_strength} damage"
		
		if first_character_strength > second_character_strength
			battle_score(first_character,second_character)
		elsif first_character_strength < second_character_strength
			battle_score(second_character,first_character)
		else
			puts "Draw!"
    end
  end
end