require 'faker'

# Base class for characters
class Character
  attr_reader :name
  attr_accessor :level

  def initialize(name:, level:)
    @name = name
    @level = level
    validate!
  end

  def strength
    @level + rand(1..12)
  end

  def card
    "#{@name} (lvl #{@level})"
  end

  private

  def validate!
    raise ArgumentError, 'Level should be a number between 1 and 99' unless (1..99).cover?(level.to_i)
  end
end

# Warrior character class
class Warrior < Character
  def level_up!(opponent_level)
    @level += (opponent_level - @level + 1)
    puts "#{name} has reached level #{level}!"
  end
end

# Monster character class
class Monster < Character; end

# Battle Arena for characters to fight on
class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_character_strength = @first_character.strength
    second_character_strength = @second_character.strength

    puts "#{@first_character.name} attacked #{@second_character.name} with #{first_character_strength} strength"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{second_character_strength} strength"

    if first_character_strength > second_character_strength
      winner = @first_character
      loser = @second_character
    elsif first_character_strength < second_character_strength
      winner = @second_character
      loser = @first_character
    else
      winner = nil
    end

    winner ? puts("The winner is #{winner.name}!") : puts('Tie!')

    winner.level_up!(loser.level) if winner.class == Warrior &&
                                     winner.level <= loser.level
  end
end

# Game engine
class Game
  def play
    warrior1 = Warrior.new(name: Faker::Witcher.witcher, level: rand(1..5))
    warrior2 = Warrior.new(name: Faker::Witcher.witcher, level: rand(1..5))
    monster1 = Monster.new(name: Faker::Witcher.monster, level: rand(5..10))

    puts 'Combatants:'
    [warrior1, warrior2, monster1].each { |character| puts character.card }

    puts "\nFirst battle: #{warrior1.card} vs. #{warrior2.card}"
    arena = BattleArena.new(warrior1, warrior2)
    arena.battle!

    puts "\nSecond battle: #{warrior1.card} vs. #{warrior2.card}"
    arena = BattleArena.new(warrior1, warrior2)
    arena.battle!

    puts "\nThird battle: #{warrior1.card} vs. #{monster1.card}"
    arena = BattleArena.new(warrior1, monster1)
    arena.battle!
  end
end

Game.new.play
