class Character
    attr_accessor :name, :level

    def initialize(name:, level:)
        self.level = (level.is_a? Integer) && level.between?(1,99) ? level : 1
        self.name = name
    end

    def card
        "#{name} (lvl #{level})"
    end

    def strength
        level + [*1..12].sample
    end
end

class Warrior < Character
    def level_up (loser)
        if level >= loser.level
            @level += 1
        else
            @level = loser.level + 1
        end
        @level = 99 if level > 99
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
        strength1 = first_character.strength
        strength2 = second_character.strength

        puts "#{first_character.name} attacked #{second_character.name} with #{strength1} damage"
        puts "#{second_character.name} attacked #{first_character.name} with #{strength2} damage"

        if strength1 == strength2
            puts "It's a draw"
            return
        end

        if strength1 < strength2
            winner = second_character
            loser = first_character
        else
            winner = first_character
            loser = second_character
        end

        puts "#{winner.name} won"

        if winner.is_a? Warrior
            winner.level_up(loser)
        end

    end

  end
