class Character
    attr_accessor :name,:level
    def initialize(name:, level:)
        @name = name.class == String ? name: "NewCharacter"
        @level = level
        @level = 1 if  (@level < 1 || @level > 99)
    end

    def strength
        level + [*1..12].sample
    end

    def card
        puts "#{name} (level #{level}.)"
    end
end


class Monster<Character
    def initialize(name:,level:)
        super(name: name,level: level)
    end
end
class Warrior<Character
    def initialize(name:,level:)
        super(name: name,level: level)
    end
    def levelUp(enemyLevel)
        x = enemyLevel - self.level
        x = 1 if x < 0 
        self.level += x 
        @level = 99 if self.level > 99
    end
end

class BattleArena
    attr_accessor :first_character, :second_character
    def initialize(first_character, second_character)
        @first_character = first_character
        @second_character = second_character
    end
    def showWarriors
        first_character.card
        second_character.card
    end
    def battle!
        strength1 = first_character.strength
        strength2 = second_character.strength
        printAttacks
        if strength1 > strength2
            puts "#{first_character.name} won!"
            first_character.levelUp(second_character.level) if first_character.class == Warrior
        end

        if strength1 == strength2
            puts "Draft!"
        end

        if strength1 < strength2
            puts "#{second_character.name} won!"
            second_character.levelUp(first_character.level) if second_character.class == Warrior
        end

    end
    private 
    def printAttacks
        puts "#{first_character.name} attacked #{second_character.name} with #{first_character.strength} dmg"
        puts "#{second_character.name} attacked #{first_character.name} with #{second_character.strength} dmg"
    end
end


samurai = Warrior.new(name: "Matsumoto",level: 15)
ninja = Monster.new(name: "Dokugan Ryu",level: 17);
kuchnia = BattleArena.new(samurai, ninja);
kuchnia.showWarriors
kuchnia.battle!
kuchnia.showWarriors

