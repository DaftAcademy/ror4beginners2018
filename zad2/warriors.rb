class Character
  attr_accessor :name
  attr_accessor :level
  def initialize(name:, level:)
    self.name = name
    self.level = level
  end
  def card
    "#{name} (lvl #{level})"
  end 
  def strength
    @level + [*1..12].sample
  end
end


class Monster < Character
end 

class Warrior < Character 
  def increase_level (second_character_level)
    #zakładamy, że gdy przegramy z przeciwnikiem o mniejszym levelu to level wygranego wzrasta o 1
    if self.level >= second_character_level
    self.level = self.level + 1
    else
     self.level = self.level + (second_character_level - self.level)
    end
  end 
end


class BattleArena
  attr_accessor :first_character
  attr_accessor :second_character
  attr_accessor :first_character_damage
  attr_accessor :second_character_damage

  def initialize(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end

  def battle!
    @first_character_damage = first_character.strength
    self.second_character_damage = second_character.strength

    self.show_battle()
    if first_character_damage > second_character_damage 
      puts "#{first_character.name} won"
      if first_character.is_a? Warrior
        first_character.increase_level(second_character.level)
      end
    elsif first_character_damage == second_character_damage  
      puts "It's a tie, both won, kinda(?)"
      
      #Z braku opisu co się dzieje w przypadku remisu, założyłam, że poziom obu wojowników zwiększa się o 1
      #W celu ułatwinia porównuje poziomy do siebie samego co zawsze da tylko plus 1
      if first_character.is_a? Warrior
        first_character.increase_level(first_character.level)
      end 
      if second_character.is_a? Warrior
          second_character.increase_level(second_character.level)
      end
    else  
      puts "#{second_character.name} won"
      if second_character.is_a? Warrior
       second_character.increase_level(first_character.level) 
      end
    end
  end

  def show_battle
    puts "#{first_character.name} attacked #{second_character.name} with #{first_character_damage} damage"
    puts "#{second_character.name} attacked #{first_character.name} with #{second_character_damage} damage"
  end 
end




warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)
puts warrior1.card # => Po (lvl 1)
puts warrior2.card # => Tai Lung (lvl 1)
puts monster1.card # => Skeleton Mage (lvl 15)
arena = BattleArena.new(warrior1, warrior2)
puts arena.battle!
# ->  Po attacked Tai Lung with 6 damage
# ->  Tai Lung attacked Po with 8 damage
# ->  Tai Lung won

puts warrior1.card # => Po (lvl 1)
puts warrior2.card # => Tai Lung (lvl 2)
puts arena.battle!
# ->  Po attacked Tai Lung with 10 damage
# ->  Tai Lung attacked Po with 7 damage
# ->  Po won
puts warrior1.card # => Po (lvl 3)
arena = BattleArena.new(warrior1, monster1)
puts arena.battle!
# ->  Po attacked Skeleton Mage with 13 damage
# ->  Skeleton Mage attacked Po with 18 damage
# ->  Skeleton Mage won

puts monster1.card # => Skeleton Mage (lvl 15)