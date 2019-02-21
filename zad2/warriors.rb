class Character
  attr_accessor :name, :level
  def initialize(name:, level:)
    self.name = name
    self.level = level
  end

  def strength
    level + [*1..12].sample
  end

  def card
    "#{name} (lvl #{level})"
  end
end

class Warrior < Character
end

class Monster < Character 
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def changeLevel(winner, looser)
    puts "#{winner.name} won"
    winner.level += looser.level unless winner.is_a? Monster
  end

  def battle!
    demage1 = @first_character.strength
    demage2 = @second_character.strength
    puts "#{@first_character.name} attacked #{@second_character.name} with #{demage1} damage"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{demage2} damage"

    if demage1 > demage2
      changeLevel(@first_character, @second_character)
    elsif demage1 < demage2
      changeLevel(@second_character, @first_character)
    end
  end
end

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(warrior1, warrior2)
5.times{ arena.battle! }

puts warrior1.card
puts warrior2.card

arena = BattleArena.new(warrior1, monster1)
5.times{ arena.battle! }

puts warrior1.card
puts monster1.card