class Character
  attr_reader :name
  attr_accessor :level

  def initialize(name, level)
  	@name = name
  	@level = ((level.is_a? Integer) && (level > 0) && (level <= 99)) ? level : 1
  end

  def strength
  	level + [*1..12].sample
  end

  def card
  	puts "#{name} (lvl #{level})"
  end
end

class Warrior < Character
end

class Monster < Character
end

#adding characters
warrior1 = Warrior.new('Po',100)
warrior2 = Warrior.new('Tai Lung','aaa')
monster1 = Monster.new('Wild Frog',5)

#checking characters
#warrior1.card # => Po (lvl 1)
#warrior1.strength # => 6
#warrior1.strength # => 5
#warrior2.card # => Tai Lung (lvl 1)
#monster1.card # => Skeleton Mage (lvl 15)

class BattleArena
  attr_accessor :character1, :character2
  def initialize(character1, character2)
  	@character1 = character1
  	@character2 = character2
  end

  def battle!
  	attack1 = character1.strength
  	attack2 = character2.strength

  	# points counting
  	if character1.level == character2.level
  	  update1 = update2 = 1
 	elsif character1.level > character2.level
 	  update1 = 1
 	  update2 = character1.level - character2.level + 1
  	else
 	  update1 = character2.level - character1.level + 1
 	  update2 = 1
 	end

  	puts "#{character1.name} attacked #{character2.name} with #{attack1} damage"
  	puts "#{character2.name} attacked #{character1.name} with #{attack2} damage"

  	# main battle
   	if attack1 > attack2
  	  puts "#{character1.name} won"
  	  # monsters don't get level up and max level for warrior is 99
  	  if (character1.is_a? Warrior) && (character1.level + update1 <= 99)
  	  	character1.level += update1
  	  elsif (character1.is_a? Warrior) && (character1.level + update1 > 99)
  	    character1.level = 99
  	  end
  	  #character1.card
  	  #character2.card
  	elsif attack2 > attack1 
  	  puts "#{character2.name} won"
  	  # monsters don't get level up and max level for warrior is 99
  	  if (character2.is_a? Warrior) && (character2.level + update2 <= 99)
  	  	character2.level += update2
  	  elsif (character2.is_a? Warrior) && (character2.level + update2 > 99)
  	    character2.level = 99
  	  end
  	  #character1.card
  	  #character2.card
  	else
  	  puts "We're tied"
  	  #character1.card
  	  #character2.card
  	end
  end
end

# warrior vs warrior
arena = BattleArena.new(warrior1, warrior2)
arena.battle!
arena.battle!
arena.battle!

# warrior vs monster
arena2 = BattleArena.new(monster1, warrior1)
arena2.battle!
arena2.battle!
arena2.battle!