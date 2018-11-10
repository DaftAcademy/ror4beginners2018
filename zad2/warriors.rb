# Mateusz Zieba
# My solution with extended fight mechanism

class Character
  attr_accessor :health_points, :multiplier
  attr_reader :name, :level
  
  def initialize(name:, level:)
    @name = name
    @level = level  
    @multiplier = 20
    @health_points = @level * @multiplier  
  end
  
  def card
    "#{@name} | HP: #{@health_points} | level: #{@level}" 
  end
  
  def roll
    [*1..12].sample
  end
  
  def strength
    roll + @level
  end

  def regen_health
    @health_points = @multiplier * level
  end

  def attack(victim)
    damage = strength
    puts "#{@name}[#{@health_points}HP] attacked #{victim.name}[#{victim.health_points}HP] with #{damage} damage"
    victim.health_points -= damage
    
    if victim.health_points < 1
      puts "\n#{name} wins the battle"
      level_up if defined? level_up
      return false
    end
    return true
  end
  
end

class Warrior < Character
  def initialize(multiplier)
    super(multiplier)
    @multiplier = 20
  end

  def level_up
    @level += 1
  end
end

class Monster < Character
  def initialize(multiplier)
    super(multiplier)
    @multiplier = 15
  end
end

class BattleArena
  def initialize(first_character, second_character)    
    @characters = [@first_char = first_character, @second_char = second_character]
  end

  def battle!
    # roll first warrior
    @first_char = @characters.sample
    @characters.delete @first_char
    @second_char = @characters.first
    puts "\nLucky Dog! #{@first_char.name} begins the battle!\n\n"
    
    while 
      @first_char.attack(@second_char) && @second_char.attack(@first_char)
    end
    @first_char.regen_health
    @second_char.regen_health
  end
end

warrior1 = Warrior.new(name: 'Anduin', level: 1)
warrior2 = Warrior.new(name: 'Khadgar', level: 1)
monster1 = Monster.new(name: 'Ghoul', level: 1)
monster2 = Monster.new(name: 'Dragonkin', level: 15)


arena = BattleArena.new(warrior1, monster1)
arena.battle!
puts warrior1.card
puts monster1.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts warrior1.card
puts warrior2.card

arena = BattleArena.new(warrior1, monster2)
arena.battle!
puts warrior1.card
puts monster2.card