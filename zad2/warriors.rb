class Character
  attr_reader :name
  attr_accessor :level
  @@MIN_LEVEL = 1
  @@MAX_LEVEL = 99
  
  def initialize(name: nil, level: @@MIN_LEVEL)
    @name = name
    @level = if (level.is_a? Integer) && level.between?(@@MIN_LEVEL, @@MAX_LEVEL)
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
  
  def self.max_level
    @@MAX_LEVEL
  end
end

class Warrior < Character
  def initialize(name: nil, level: @@MIN_LEVEL)
    super
  end
  
  def level_up(defeated_opponent_level)  
    level_diff = defeated_opponent_level - level
    if level_diff > 0
      @level += level_diff
    end
    @level += 1	
	@level = [@level, @@MAX_LEVEL].min
  end
end

class Monster < Character
  def initialize(name: nil, level: @@MIN_LEVEL)
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
	      @first_character.level_up(@second_character.level)
	    end
	  else
	    show_winner(@second_character.name)
		if second_character.is_a? Warrior 
	      @second_character.level_up(@first_character.level)
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
end

# Some tests

warrior1 = Warrior.new(name: 'Po', level: 1)
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

warrior2.level = Character.max_level
warrior2.card
arena.battle!
warrior1.card
warrior2.card

arena = BattleArena.new(warrior1, monster1)
arena.battle!

monster1.card