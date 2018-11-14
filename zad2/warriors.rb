MIN_LEVEL=1
MAX_LEVEL=99

class Character
  attr_accessor :name
  attr_accessor :level
  def initialize(name, level)
    @name=name
    @level=[MAX_LEVEL,[level,MIN_LEVEL].max].min
  end
  def strength
    @level + [*1..12].sample
  end
  def card
    puts "#{name} (lvl #{level})"
  end
  def change_lvl(opponent_lvl)
  end
end
  
class Warrior < Character
    def change_lvl(opponent_lvl)
        if @level >= opponent_lvl
          @level=[@level+1, MAX_LEVEL].min
        else @level=[opponent_lvl+1, MAX_LEVEL].min
        end
      end
end

class Monster < Character
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character=first_character
    @second_character=second_character
  end
  def score(winner, loser)
    puts "#{winner.name} won"
    winner.change_lvl(loser.level)
  end
  def battle!
    strength1=@first_character.strength
    strength2=@second_character.strength
    puts "#{@first_character.name} attacked #{@second_character.name} with #{strength1} damage"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{strength2} damage"
    case strength1 <=> strength2  
    when 1
      score(@first_character,@second_character)
    when -1
      score(@second_character,@first_character)
    when 0
      puts "No one won"
    end
  end
end

warrior1 = Warrior.new('Po', 1)
warrior2 = Warrior.new('Tai Lung', 4)
monster1 = Monster.new('Skeleton Mage', 15)
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

arena = BattleArena.new(warrior1, monster1)
arena.battle!
monster1.card
