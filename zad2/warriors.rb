class Character
    attr_accessor :name, :level
    def initialize(name:, level:)
        self.name = name   
        self.level = level
    end
  
    def strength
        self.level+[*1..12].sample
    end

    def card
         "#{name} (lvl #{level})"
    end
end

class Monster < Character
end

class Warrior < Character
end

class BattleArena
    attr_accessor :first_character, :second_character

    def initialize(first_character, second_character)
        self.first_character = first_character
        self.second_character = second_character
    end

    def battle!
        x = first_character
        y = second_character
        x_hit = x.strength
        y_hit = y.strength
        puts "#{x.name} attacked #{y.name} with #{x_hit} damage"
        puts "#{y.name} attacked #{x.name} with #{y_hit} damage"
        if(x_hit > y_hit)
            puts "#{x.name} won"
            x.level=[99,[x.level,y.level].max+1].min unless x.is_a? Monster
        elsif(y_hit > x_hit)
            puts "#{y.name} won"
            y.level=[99,[x.level,y.level].max+1].min unless y.is_a? Monster
        else
            puts "It's a draw"
        end
     end
end