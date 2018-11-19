class Character
  
  attr_accessor :name
  attr_accessor :level

  def initialize(name:, level:)
    self.name=name
    self.level=level
  end

  def strength
    [*1..12].sample + self.level
  end

  def card
    puts"Name: #{name}, Level: #{level}"
  end
end

class Warrior < Character
end
class Monster < Character
end

class BattleArena
  
  attr_accessor :first_character
  attr_accessor :second_character

  def initialize(first_character, second_character)
    self.first_character=first_character
    self.second_character=second_character
  end

  def fight(winner,loser)
    if winner.is_a? Warrior 
      if winner.level < loser.level
        winner.level += loser.level-winner.level + 1
      elsif winner.level == loser.level 
        winner.level + 1
      end
    end
  end

  def announcement(damage1,damage2)
    puts "#{first_character.name} attacked #{second_character.name} with #{damage1} damage"
    puts "#{second_character.name} attacked #{first_character.name} with #{damage2} damage"
  end

  def who_win(damage1,damage2)
    if(damage1 > damage2) 
      puts first_character.name  + " won"
      fight(first_character, second_character)
    elsif (damage2 > damage1)
      puts second_character.name + " won"
      fight(second_character, first_character)
    else
      puts "tie"
    end
  end

  def battle!
  damage1=first_character.strength
  damage2=second_character.strength
  announcement(damage1, damage2)
  who_win(damage1, damage2)
  end
end

warrior1 = Warrior.new(name: 'Po', level:  2)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(monster1,warrior1)
arena.battle!

puts warrior1.card
puts monster1.card
