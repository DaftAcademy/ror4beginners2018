class Character
      attr_accessor :name
      attr_accessor :level
  
  def initialize(name:, level:)
    @name=name
    self.level=level
  end

  def strength
    [*1..12].sample + @level
  end

  def card
    "#{self.name}, character level #{self.level})"
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

    puts "Let's start this battle!"
   
    attack(@first_character, @second_character,damage_1)
    attack(@second_character, @first_character,damage_2)
    
    winner_loser(damage_1,damage_2)
    

    private

    def levels(first, second)
      if first.instance_of? Warrior && first.level < second.level
        first.level += second.level-winner.level + 1
     elsif first.level == second.level 
      first.level + 1
     end
    end
  end

  def winner_loser(first,second)
    if(first > second) 
      levels(first_character, second_character)
      puts "first_character.name won"
    elsif (first < second)
     levels(second_character, first_character)
    else
      puts "We have a draw!"
    end
  end

  def attack(fighter, defender, damage)
    puts "#{fighter.name} attacked #{defender.name} with #{damage} damage"
  end
end
