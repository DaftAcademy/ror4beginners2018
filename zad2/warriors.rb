class Character
  attr_accessor :name
  attr_accessor :level

  def is_level_valid?(level)
  	level.to_i.between?(1, 99)
  end

  def initialize(name: "", level: 1)
  	@name = name.to_s
  	@level = is_level_valid?(level) ? level.to_i : 1
  end

  def strength
  	@level + [*1..12].sample
  end

end

class Warrior < Character

  def initialize(name, level)
  	super(name: name, level: level)
  end

  def card
  	puts "#{@name}, (level #{@level})"
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
      unless @first_character.is_a? Monster
      	@first_character.level += [ @second_character.level - @first_character.level + 1, 0 ].max
      end
    elsif strength1 < strength2
      puts "#{@second_character.name} won!"
      unless @second_character.is_a? Monster
      	@second_character.level += [ @first_character.level - @second_character.level + 1, 0 ].max
      end
    else
      puts 'Draw!'
      battle!
    end
  end

end

warrior1 = Warrior.new("Warrior1", 5)
warrior2 = Warrior.new("Warrior2", 5)

warrior1.card
warrior2.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!

warrior1.card
warrior2.card
