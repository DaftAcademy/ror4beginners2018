require 'faker'
require 'ordinalize'

# Base class for characters
class Character
  attr_reader :name
  attr_accessor :level

  def initialize(name:, level:)
    @name = name
    @level = level
    validate!
  end

  def strength(dice_roll)
    @level + dice_roll
  end

  def card
    "#{@name} (lvl #{@level})"
  end

  def roll_1k12
    rand(1..12)
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
    strength = set_strength

    puts "#{@first_character.name} attacked #{@second_character.name} with #{strength[:first]} strength"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{strength[:second]} strength"

    winner, loser = results(strength)

    winner ? puts("The winner is #{winner.name}!") : puts('Tie!')

    winner.level_up!(loser.level) if winner.class == Warrior &&
                                     winner.level <= loser.level
  end

  private

  def set_strength
    { first: @first_character.strength(@first_character.roll_1k12),
      second: @second_character.strength(@second_character.roll_1k12) }
  end

  def results(strength)
    case strength[:first] <=> strength[:second]
    when 1 then [@first_character, @second_character]
    when -1 then [@second_character, @first_character]
    end
  end
end

# Game engine
class Game
  @@battle_no = 1

  def play
    warrior1 = create_warrior
    warrior2 = create_warrior
    monster1 = create_monster

    puts 'Combatants:'
    [warrior1, warrior2, monster1].each { |character| puts character.card }

    2.times { set_battle(warrior1, warrior2) }
    set_battle(warrior1, monster1)
  end

  private

  def create_warrior
    Warrior.new(name: Faker::Witcher.witcher, level: rand(1..5))
  end

  def create_monster
    Monster.new(name: Faker::Witcher.monster, level: rand(5..10))
  end

  def set_battle(first_char, second_char)
    puts "\n#{@@battle_no.ordinalize.capitalize} battle: #{first_char.card} vs. #{second_char.card}"
    BattleArena.new(first_char, second_char).battle!
    @@battle_no += 1
  end
end

Game.new.play
