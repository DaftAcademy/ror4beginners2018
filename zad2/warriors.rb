class Character
  attr_accessor :name
  attr_accessor :level
  def initialize(name, level)
    @name=name
    @level=level
  end
  def strength
    @level + [*1..12].sample
  end
  def card
    puts "#{name} (lvl #{level})"
  end
end
  
class Warrior < Character
  def change_lvl(opponent_lvl)
    if @level >= opponent_lvl
      @level+=1
    else @level+=(opponent_lvl-@level+1)
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
  def battle!
    strength1=@first_character.strength
    strength2=@second_character.strength
    puts "#{@first_character.name} attacked #{@second_character.name} with #{strength1} damage"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{strength2} damage"
    if strength1 > strength2
      puts "#{@first_character.name} won"
      if @first_character.is_a? Warrior
        @first_character.change_lvl(@second_character.level)
      end
    elsif
      strength1 < strength2
      puts "#{@second_character.name} won"
      if @second_character.is_a? Warrior
        @second_character.change_lvl(@first_character.level)
      end
    else puts "No one won"
    end
  end
end

warrior1 = Warrior.new('Po', 1)
warrior2 = Warrior.new('Tai Lung', 1)
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