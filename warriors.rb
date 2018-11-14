class Character
  attr_accessor :name, :level

  def initialize(name: , level:)
    self.name = name
    self.level = level
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "#{name}, lvl #{level}"
  end
  
end

class Warrior < Character
  
  def initialize(name:, level:)
    @name = name
    @level = level
  end

end    


class Monster < Character
    def initialize name: , level:
        super(name: name, level: level)
    end
end

class BattleArena
  
  attr_accessor :first_character, :second_character
  
  def initialize(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end  

  def levelUp(winner, loser)
    winner.level += loser.level unless winner.is_a? Monster
  end

def battle!
    strength1 = first_character.strength 
    strength2 = second_character.strength

    puts "#{first_character.name} attacked #{second_character.name} with #{strength1} damage"
   	puts "#{second_character.name} attacked #{first_character.name} with #{strength2} damage"
   	
   
   	if strength1 > strength2
        puts "#{first_character.name} won!"
        levelUp(self.first_character, self.second_character)
            
    elsif strength1 < strength2
        
        puts "#{second_character.name} won!"
        levelUp(self.second_character, self.first_character)
    else
        puts "Draw!"
        
        end   
    end
    
end

   
# GRA
warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)
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

