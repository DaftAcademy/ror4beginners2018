class Character
	attr_accessor :name
	attr_accessor :level

  def initialize(name: "default_Character", level: 1)
    @name = name
  	if level.between?(1, 99)
      @level = level
    else
      raise "Level is incorect. Should be from 1 to 99 range."
    end
  end

  def strength()
    @level + [*1..12].sample
  end

  def card()
    "I am the mighty #{@name}! My level is #{@level} cm long"
  end
end

class Warrior < Character
end

class Monster < Character
  def card()
    "I am the scary #{@name}! My level is #{@level} and you'll be dead soon#{"\u2122"}"
  end
end

class BattleArena

  def initialize(first_character, second_character)
  	@first_character = first_character
  	@second_character = second_character
  end

  def battle!()
    first_character_attack = attack(@first_character, @second_character)
  	second_character_attack = attack(@second_character, @first_character)
  	puts winner(first_character_attack, second_character_attack)
  end
  
  private
  def attack(attacker, defender)
  	puts "#{attacker.name} attacked #{defender.name} with #{attack = attacker.strength} damage"
  	return attack
  end

  def winner(first_character_attack, second_character_attack)
  	if first_character_attack == second_character_attack
  	  return "It's a draw! We'll have a rematch!"  
  	elsif first_character_attack > second_character_attack
  	  if @first_character.is_a? Warrior
  	      count_new_level(@first_character, @second_character)
  	  end
  	  return "#{@first_character.name} wins!"
  	else
  	  if @second_character.is_a? Warrior
  	     count_new_level(@second_character, @first_character)
  	  end
  	  return "#{@second_character.name} wins!"
  	end
  end

  def count_new_level(winner, looser)
    if winner.level >= looser.level
      winner.level +=1
    else
      winner.level += (winner.level - looser.level).abs
    end
  end
end

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

puts warrior1.card # => Po (lvl 1)
puts warrior1.strength # => 6
puts warrior1.strength # => 5
puts warrior2.card # => Tai Lung (lvl 1)
puts monster1.card # => Skeleton Mage (lvl 15)
puts "\n"
arena = BattleArena.new(warrior1, warrior2)
arena.battle!
# ->  Po attacked Tai Lung with 6 damage
# ->  Tai Lung attacked Po with 8 damage
# ->  Tai Lung won
puts "\n"
puts warrior1.card # => Po (lvl 1)
puts warrior2.card # => Tai Lung (lvl 2)
puts "\n"
arena.battle!
puts warrior1.card # => Po (lvl 1)
puts warrior2.card # => Tai Lung (lvl 2)
puts "\n"
arena.battle!
puts warrior1.card # => Po (lvl 1)
puts warrior2.card # => Tai Lung (lvl 2)
puts "\n"
arena.battle!
puts warrior1.card # => Po (lvl 1)
puts warrior2.card # => Tai Lung (lvl 2)
# ->  Po attacked Tai Lung with 10 damage
# ->  Tai Lung attacked Po with 7 damage
# ->  Po won
puts warrior1.card # => Po (lvl 3)
puts "\n"
arena = BattleArena.new(warrior1, monster1)
arena.battle!
# ->  Po attacked Skeleton Mage with 13 damage
# ->  Skeleton Mage attacked Po with 18 damage
# ->  Skeleton Mage won

puts monster1.card # => Skeleton Mage (lvl 15)

#warrior5 = Warrior.new(name: 'Po', level:  -1)