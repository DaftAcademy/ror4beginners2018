class TypeError

  def message
    'Wrong type!'
  end

end

class Character

  attr_accessor :name
  attr_accessor :level

  def eval_level()
    raise TypeError unless @level.is_a? Integer

    @level = 1 if level < 1

    @level = 99 if level > 99
  end

  def eval_name()
    raise TypeError unless @name.is_a? String
  end

  def initialize(name: "", level: 1)
    @name = name
    @level = level
    eval_name
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
    @level += [ opponents_level - @level + 1, 0 ].max
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
    if first_character.is_a? Character and second_character.is_a? Character
      @first_character = first_character
      @second_character = second_character
    else
      raise TypeError
    end
  end

  def battle!
    strength1 = @first_character.strength
    strength2 = @second_character.strength

    puts "#{@first_character.name} hit #{@second_character.name} for #{strength1} points."
    puts "#{@second_character.name} hit #{@first_character.name} for #{strength2} points."

    if strength1 > strength2
      puts "#{@first_character.name} won!"
      @first_character.level_up(@second_character.level) unless @first_character.is_a? Monster
    elsif strength1 < strength2
      puts "#{@second_character.name} won!"
      @second_character.level_up(@first_character.level) unless @second_character.is_a? Monster
    else
      puts 'Draw!'
      battle!
    end
  end

end

warrior1 = Warrior.new("Warrior1", 99)
warrior2 = Warrior.new("Warrior2", 90)

warrior1.card
warrior2.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!

warrior1.card
warrior2.card
