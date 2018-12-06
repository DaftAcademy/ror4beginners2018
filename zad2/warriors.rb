class Character
  attr_accessor :name , :level
  def initialize(name:, level:)
    self.name = name
    self.level = level
  end

  def strength
    level+[*1..12].sample
  end

  def card
    "#{name}, level #{level}"
  end
end

class Warrior < Character
  def level_up up
    level = min(level+up, 99)
  end
end

class Monster < Character

end

class BattleArena
  attr_accessor :first_character, :second_character

  def initialize(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end

  def battle!
    p '-------FIGHT-------'
    p "#{first_character.card} vs #{second_character.card}"
    first_strike = first_character.strength
    second_strike = second_character.strength
    p ("#{first_character.name} strikes for #{first_strike}")
    p ("#{second_character.name} strikes for #{second_strike}")
    if(first_strike == second_strike)
      p 'Its a tie!'
      return
    elsif(first_strike > second_strike)
      winner = first_character
      loser = second_character
    else
      winner = second_character
      loser = first_character
    end
    if(winner.is_a? Warrior)
      winner.level_up([1, loser.level-winner.level+1].max)
    end
    p "Winner is #{winner.card}"
  end
end

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
arena.battle!
arena.battle!
arena.battle!

