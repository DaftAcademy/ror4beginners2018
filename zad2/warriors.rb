class Character
  attr_accessor :name, :level

  def initialize(name: , level: )
    unless level.between?(1, 99) 
      raise "Level out of range"
    end
    @name = name
    @level = level
  end

  def card
    "#{@name} (lvl #{@level})"
  end
  
    def strength
    @level + [*1..12].sample
  end

end

class Warrior < Character
  def level_up(character)
    if character.level > @level
      @level = character.level + 1
    else
      @level += 1
    end
  end
end

class Monster < Character
end
    


class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end
  
  def battle!
      puts "\n#{@first_character.card} and #{@second_character.card} enter the Battle Arena"
      
      strength1 = @first_character.strength
      strength2 = @second_character.strength
      puts "#{@first_character.name} attacked #{@second_character.name} with #{strength1} damage"
      puts "#{@second_character.name} attacked #{@first_character.name} with #{strength2} damage"
      
      if strength1 > strength2
      
        puts "#{@first_character.name} won!" 
        if @first_character.is_a?Warrior
          @first_character.level_up(@second_character)
        end
      
      elsif strength1 < strength2
      
        puts "#{@second_character.name} won!"
        if @second_character.is_a?Warrior
          @second_character.level_up(@sfirst_character)
        end
        
      else
       puts "It's a draw!"
      end
      
      puts "#{@first_character.card} and #{@second_character.card} leave the Battle Arena\n"
  
  end
end

warrior1 = Warrior.new(name: 'Tai Lung', level: 6)
warrior2 = Warrior.new(name: 'Po', level: 5)
monster1 = Monster.new(name: 'Skeleton Mage', level: 7)

arena = BattleArena.new(warrior1, warrior2)
7.times {arena.battle!}

arena = BattleArena.new(warrior1, monster1)
7.times {arena.battle!}
