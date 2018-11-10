class Character
  attr_reader :name
  attr_accessor :level

  def initialize(name:, level:)
    @name = name
    self.level = level
  end

  def strength
    dice + self.level
  end

  def card
    "#{self.name} (lvl #{self.level})"
  end

  private

  def dice
    [*1..12].sample
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

  def battle!
    damage_1 = @first_character.strength
    damage_2 = @second_character.strength
    winner = nil
    loser = nil

    puts "#{@first_character.name} attacked #{@second_character.name} with #{damage_1} damage"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{damage_2} damage"

    if damage_1 > damage_2
      winner = @first_character
      loser = @second_character
    elsif damage_1 < damage_2
      winner = @second_character
      loser = @first_character
    end

    if winner == nil
      return
    end

    puts "#{winner.name} won"

    if winner.instance_of? Warrior and winner.level <= loser.level
      winner.level += loser.level - winner.level + 1
    end
  end
end