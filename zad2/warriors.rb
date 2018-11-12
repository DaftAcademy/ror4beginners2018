require 'faker'

class TypeError

  # Custom message in TypeError class
  def message
    'Wrong type!'
  end

end

class Character

  attr_reader :name
  attr_accessor :level

  def fix_level
    @level = 1 if level < 1
    @level = 99 if level > 99
  end

  def initialize(name: "", level: 1)
  	# We want the name to be a string and the level to be an integer
    raise TypeError unless (name.is_a? String) && (level.is_a? Integer)

    @name = name
    @level = level
    
    # Fix level - it might be out f range
    fix_level
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    puts "#{@name} (level #{@level})"
  end

end

class Warrior < Character

  def initialize(name, level)
    super(name: name, level: level)
  end

  def level_up(opponent)
    # Raise level by proper amount if it's lesser than or equal to opponent's, else do nothing
    @level = opponent.level + 1 unless @level > opponent.leve
    # Fix level - it might be out of range
    fix_level
  end

end

class Monster < Character

  def initialize(name, level)
    super(name: name, level: level)
  end

end

class BattleArena
  
  def initialize(first_character, second_character)
    # We want the fighters to by of type Character
    raise TypeError unless (first_character.is_a? Character) && (second_character.is_a? Character)
    
    @first_character = first_character
    @second_character = second_character  
  end

  def battle!
    damage1 = @first_character.strength
    damage2 = @second_character.strength

    puts "#{@first_character.name} attacked #{@second_character.name} for #{damage1} damage."
    puts "#{@second_character.name} attacked #{@first_character.name} for #{damage2} damage."

    if damage1 > damage2
      puts "#{@first_character.name} won!"
      # Monsters' levels do not change
      @first_character.level_up(@second_character) unless @first_character.is_a? Monster
    elsif damage1 < damage2
      puts "#{@second_character.name} won!"
      # Monsters' levels do not change
      @second_character.level_up(@first_character) unless @second_character.is_a? Monster
    else
      puts "Draw!"
      # Recursively repeat the battle if damage1 == damage2
      battle!
    end
  end

end

warrior1 = Warrior.new(Faker::Witcher.witcher, [*1..99].sample)
warrior2 = Warrior.new(Faker::Witcher.character, [*1..99].sample)
monster1 = Monster.new(Faker::Witcher.monster, [*1..99].sample)
monster2 = Monster.new(Faker::Witcher.monster, [*1..99].sample)

puts "====================WARRIORS=============================="
warrior1.card
warrior2.card
puts

puts "====================MONSTERS=============================="
monster1.card
monster2.card
puts

puts "====================WARRIOR vs WARRIOR===================="
arena1 = BattleArena.new(warrior1, warrior2)
arena1.battle!
puts

puts "====================MONSTER vs MONSTER===================="
arena2 = BattleArena.new(monster1, monster2)
arena2.battle!
puts

puts "====================WARRIOR vs MONSTER===================="
arena3 = BattleArena.new(warrior1, monster1)
arena3.battle!
puts

puts "====================MONSTER vs WARRIOR===================="
arena4 = BattleArena.new(monster2, warrior2)
arena4.battle!
puts

puts "====================END SCORE============================="
warrior1.card
warrior2.card
monster1.card
monster2.card