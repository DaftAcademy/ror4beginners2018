class Character
  attr_accessor :name, :level

  def initialize name, level
    self.name = name
    self.level = level
  end

  def card
  puts "Character's name: #{name}"
  puts "Character's level: #{level}"
  end
end

class Warrior < Character

def initialize (name, level)
  @name = name
  @level = level
end

  def strength
  @level + [*1..12].sample
  end

def level_up(looser)
      lev = self.level >= looser.level.to_i ? 1 : looser.level.to_i - self.level.to_i
      self.level += lev.to_i
  end
end

class Monster < Character

def initialize (name, level)
  @name = name
  @level = level
end

end

class BattleArena

  attr_accessor :character, :character2

  def initialize character, character2
    self.character = character
    self.character2 = character2
  end

  def battle!

c1 = character.is_a?(Warrior) ? character.strength : character.level

c2 = character2.is_a?(Warrior) ? character2.strength : character2.level

  puts "#{character.name} attacked #{character2.name} with #{c1} damage"

  puts "#{character2.name} attacked #{character.name} with #{c2} damage"

  if self.character.is_a?(Warrior) &&(c1.to_i > c2.to_i)
  winner = character
  looser = character2
  puts "#{character.name} won!"
  elsif self.character2.is_a?(Warrior) &&(c1.to_i < c2.to_i)
  winner = character2
  looser = character
  puts "#{character2.name} won!"
  end

  if winner.is_a?(Warrior)
   winner.level_up(looser)
   end
 end

end

# GRA
warrior1 = Warrior.new('Po', 1)
warrior2 = Warrior.new('Tai Lung', 1)
monster1 = Monster.new('Skeleton Mage', 15)
 arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts "-- First round results --"
puts warrior1.card
puts warrior2.card
 arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts "-- Second round results --"
puts warrior1.card
puts warrior2.card
 arena = BattleArena.new(warrior1, monster1)
arena.battle!
 puts "-- Third round results --"
puts warrior1.card
puts monster1.card