class Character
  attr_accessor :name, :level 
  def initialize(name:, level:)
    self.name = name
    self.level = level
  end
  
  def strength
    str = self.level + [*1..12].sample
  end
  
  def card
    "#{name}, #{level} lvl."
 end
end

class Warrior < Character
  def lvlup n
    self.level += n
  end

end

class Monster < Character
end

class BattleArena
  attr_reader :first_character, :second_character
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle
      puts "#{first_character.card} vs #{second_character.card} "

      a = first_character.strength
      b = second_character.strength
      puts "#{first_character.name} attacks with strength #{a}"
      puts "#{second_character.name} attacks with strength #{b}"
      if (a == b)
         puts "draw"
      end
      if (a > b) 
        puts "#{first_character.name} won"
        if (first_character.level >= second_character.level)
          first_character.lvlup(1) 
        else
          x = (second_character.level - first_character.level)
          first_character.lvlup(x) 
        end
      else 
        puts "#{second_character.name} won"
       end   
  end
end

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(warrior1, warrior2)
arena.battle
puts warrior1.card
puts warrior2.card
 arena.battle
puts warrior1.card
puts warrior2.card
 arena1 = BattleArena.new(warrior1, monster1)
arena1.battle
puts monster1.card

