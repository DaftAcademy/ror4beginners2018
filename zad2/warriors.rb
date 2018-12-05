class Character
  attr_accessor :name
  attr_accessor :level

  def initialize(name, level)
    @name = name
    @level = level
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "#{@name} (lvl #{@level})"
  end 
end

class Warrior < Character

  def new_level(enemy)
    if @level < enemy.level
      @level = enemy.level + 1
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

    strength1 = @first_character.strength
    strength2 = @second_character.strength
    character1 = @first_character.name
    character2 = @second_character.name

    puts "#{character1} attacked #{character2} with #{strength1} damage."
    puts "#{character2} attacked #{character1} with #{strength2} damage."

    if strength1 > strength2
      puts "#{character1} won!"

      @first_character.new_level(@second_character) if @first_character.is_a? Warrior

    elsif strength2 > strength1
      puts "#{character2} won!"

      @second_character.new_level(@first_character) if @second_character.is_a? Warrior

    else
      puts "The battle ended in a draw."
        
    end

  end
end

#Game: Ancient Battles

warrior1 = Warrior.new('Heracles', 1)
warrior2 = Warrior.new('Theseus', 1)
warrior3 = Warrior.new('Perseus', 1)

monster1 = Monster.new('Hydra', 5)
monster2 = Monster.new('Minotaur', 6)
monster3 = Monster.new('Chimera', 7)



arena1 = BattleArena.new(warrior1, monster1)

puts "\n", 'Battle I'
arena1.battle!

puts warrior1.card
puts monster1.card

puts "\n", 'Battle II'
arena1.battle!

puts warrior1.card
puts monster1.card

puts "\n", 'Battle III'
arena1.battle!

puts warrior1.card
puts monster1.card
