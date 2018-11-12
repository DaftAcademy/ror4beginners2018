class TypeError

  def message
    'Wrong type!'
  end

end

class Character

  attr_reader :name
  attr_accessor :level

  def eval_level
    @level = 1 if level < 1
    @level = 99 if level > 99
  end

  def initialize(name: "", level: 1)
  	raise TypeError unless (name.is_a? String) && (level.is_a? Integer)

    @name = name
    @level = level
    
    eval_level
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    puts "#{@name}, (level #{@level})"
  end

end

class Warrior < Character

  def initialize(name, level)
    super(name: name, level: level)
  end

  def level_up(opponents_level)
    @level = opponents_level + 1 unless @level > opponents_level
    eval_level
  end
  
end

class Monster < Character

  def initialize(name, level)
    super(name: name, level: level)
  end

end

class BattleArena
  
  def initialize(first_character, second_character)
    raise TypeError unless (first_character.is_a? Character) && (second_character.is_a? Character)
    
    @first_character = first_character
    @second_character = second_character  
  end

  def battle!
    damage1 = @first_character.strength
    damage2 = @second_character.strength

    puts "#{@first_character.name} hit #{@second_character.name} for #{damage1} points."
    puts "#{@second_character.name} hit #{@first_character.name} for #{damage2} points."

    if damage1 > damage2
      puts "#{@first_character.name} won!"
      @first_character.level_up(@second_character.level) unless @first_character.is_a? Monster
    elsif damage1 < damage2
      puts "#{@second_character.name} won!"
      @second_character.level_up(@first_character.level) unless @second_character.is_a? Monster
    else
      puts 'Draw!'
      battle!         # Repeat the battle if damage1 = damage2
    end
  end

end

warrior1 = Warrior.new("Warrior1", 1)
warrior2 = Warrior.new("Warrior2", 2)

warrior1.card
warrior2.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!

warrior1.card
warrior2.card
