class Character
  attr_reader :name
  attr_accessor :level
  
  def initialize(name: nil, level: 1)
    @name = name
    @level = if (level.is_a? Integer) && level.between?(1, 99)
	  level
	else
	  1
	end
  end
  
  def strength
    self.level + [*1..12].sample
  end
  
  def card
    puts "#{name} (lvl #{level})"
  end
end

class Warrior < Character
  def initialize(name: nil, level: nil)
    super
  end
end

class Monster < Character
  def initialize(name: nil, level: 1)
    super
  end
end

class BattleArena
  attr_reader :first_character
  attr_reader :second_character

  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end
  
  def battle!
    first_character_strength = @first_character.strength
    second_character_strength = @second_character.strength
	
    battle_log(@first_character.name, @second_character.name, first_character_strength)
    battle_log(@second_character.name, @first_character.name, second_character_strength)
	
	if first_character_strength == second_character_strength
	  puts "It's draw"
	  battle!
	else
	  if first_character_strength > second_character_strength
	    show_winner(@first_character.name)
		if first_character.is_a? Warrior 
	      level_up(@first_character, @second_character)
	    end
	  else
	    show_winner(@second_character.name)
		if second_character.is_a? Warrior 
	      level_up(@second_character, @first_character)
	    end
	  end
	end
  end
  
  def battle_log(attacking_character_name, attacked_characker_name, strength)
    puts "#{attacking_character_name} attacked #{attacked_characker_name} with #{strength} damage"
  end
  
  def show_winner(winner_name)
    puts "#{winner_name} wins"
  end
  
  def level_up(winner, loser)
    level_diff = loser.level - winner.level
    if level_diff > 0
      winner.level += level_diff
	  winner.level = [winner.level, 98].min
    end
    winner.level += 1
  end
end

# Some tests

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

warrior1.card
warrior1.strength
warrior1.strength
warrior2.card
monster1.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
warrior1.card
warrior2.card

arena.battle!
warrior1.card
warrior2.card

arena.battle!
warrior1.card
warrior2.card

arena.battle!
warrior1.card
warrior2.card

arena.battle!
warrior1.card
warrior2.card

arena = BattleArena.new(warrior1, monster1)
arena.battle!

monster1.card