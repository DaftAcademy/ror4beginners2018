class Character
    attr_accessor :name
    attr_accessor :level

    def initialize(name:, level:)
        self.name=name
        self.level=level
    end
  
    def strength
        level+[*1..12].sample
    end

  end


class Warrior < Character
    def card
        "Warrior #{name} - level #{level}"
    end
end
  
class Monster < Character
    def card
        "Monster #{name} - level #{level}"
    end
end
  
class BattleArena
    attr_accessor :first_character, :second_character
    def initialize(first_character, second_character)
        @first_character=first_character
        @second_character=second_character
    end

    def battle!
        winner = Character.new(name: 'NN', level: 1)
        puts "#{first_character.name} attacked #{second_character.name} with #{first_character.strength} damage."
        puts "#{second_character.name} attacked #{first_character.name} with #{second_character.strength} damage."
        if second_character.strength < first_character.strength
            winner = first_character
        elsif (second_character.strength == first_character.strength && [*1..2]<1.5)
            winner = first_character
        else
            winner = second_character
        end
        
        puts "#{winner.name} won."
        if winner.is_a?(Warrior)
            winner.level += 1
        end
        

    end
end



warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)
puts warrior1.card # => Po (lvl 1)
puts warrior1.strength # => 6
puts warrior1.strength # => 5
puts warrior2.card # => Tai Lung (lvl 1)
puts monster1.card # => Skeleton Mage (lvl 15)

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts warrior1.card
puts warrior2.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts warrior1.card
puts warrior2.card


