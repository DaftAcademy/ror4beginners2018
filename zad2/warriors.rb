class Character
  attr_reader :name, :level

  def initialize(name:, level:)
    raise ArgumentError.new('Level must be in range from 1 to 99') if !level_validity(level)
    @name = name
    @level = level.to_i
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "#{name} (lvl #{level})"
  end

  private

  def level_validity(level)
    level.between?(1, 99)
  end
end

class Warrior < Character

  def add_exp(loser_level)
    if @level <= loser_level
      @level = level_validity(loser_level + 1) ? loser_level + 1 : 99
    end
  end
end

class Monster < Character
end

class BattleArena
  attr_accessor :first_character, :second_character
  def initialize(first_character, second_character)
    raise ArgumentError.new('Characters must be either warriors or monsters') unless 
    (first_character.is_a? Character) && (second_character.is_a? Character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_character_damage = first_character.strength
    second_character_damage = second_character.strength
    loser_level = get_loser_level(first_character_damage, second_character_damage)
    winner = get_winner(first_character_damage, second_character_damage)
    
    winner.add_exp(loser_level) if winner.is_a? Warrior
    puts "#{first_character.name} attacked #{second_character.name} with #{first_character_damage} damage"
    puts "#{second_character.name} attacked #{first_character.name} with #{second_character_damage} damage"
    puts winner == nil ? 'It\'s a draw!' : "#{winner.name} won"
  end

  private

  def get_winner(first_damage, second_damage)
    return nil if first_damage == second_damage
    first_damage > second_damage ? first_character : second_character
  end

  def get_loser_level(first_damage, second_damage)
    first_damage > second_damage ? second_character.level : first_character.level
  end
end