class Character
  attr_accessor :name, :level
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
class Warrior < Character
  def lvlup n
    self.level += n
  end
 end
 class Monster < Character
end
 class BattleArena
  attr_accessor :first_character, :second_character
   def initialize(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end
   def battle!
    damage1 = first_character.strength
    damage2 = second_character.strength
    fight(damage1, damage2)
    dmg(damage1, damage2)
  end
  def fight(damage1, damage2)
    puts "#{first_character.name} atakuje #{second_character.name} z #{damage1} siły"
    puts "#{second_character.name} atakuje #{first_character.name} z #{damage2} siły"
  end
  def dmg(damage1, damage2)
    if(damage1 > damage2) 
      puts first_character.name  + " Wygrał"
      level_up(first_character, second_character)
    elsif (damage2 > damage1)
      puts second_character.name + " Wygrał"
      level_up(second_character, first_character)
    else
      puts "remis"
    end
  end
   def level_up(winner, loser)
    if winner.is_a? Warrior
      if winner.level < loser.level
        winner.level += 1
      elsif winner.level == loser.level
        winner.level += 1
      elsif winner.level > loser.level
        winner.level += 1
      end
    end
  end
end
warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)
 arena = BattleArena.new(warrior1,warrior2)
arena.battle!
puts warrior1.card
puts warrior2.card
 arena = BattleArena.new(warrior1,monster1)
arena.battle!
puts warrior1.card
puts monster1.card
