class CustomError < StandardError

        def message
                'Wrong Level'
        end
end

class Character
        attr_accessor :name
        attr_accessor :level
        def initialize(name:,level:)
                if level < 1 || level > 99
                        begin
                                raise CustomError
                        rescue CustomError => e
                                e.message
                        end
                        return
                end
                self.name = name
                self.level = level
        end

        def strength
                level + [*1..12].sample
        end

	def card
                "#{name} (lvl #{level})"
        end
end

class Warrior < Character
end

class Monster < Character
end

class BattleArena
	attr_accessor :first_character
        attr_accessor :second_character
  def initialize(first_character, second_character)
	  self.first_character = first_character
          self.second_character = second_character
  end

          def battle!
                a = first_character.strength
                b = second_character.strength
                puts "#{first_character.name} attecked #{second_character.name} with #{a} damage"
                puts "#{second_character.name} attecked #{first_character.name} with #{b} damage"
                if a > b
                        puts "#{first_character.name} won"
                        if first_character.is_a? Warrior
                                first_character.level += (first_character.level - second_character.level).abs + 1
                        end
                elsif a < b
                        puts "#{second_character.name} won"
                        if second_character.is_a? Warrior
                                second_character.level += (first_character.level - second_character.level).abs + 1
                        end
                else
                        puts "tiescore"
                end
        end

end

warrior1 = Warrior.new(name: 'Po', level: 1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

puts warrior1.card
puts warrior1.strength
puts warrior1.strength
puts warrior2.card
puts monster1.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts warrior1.card
puts warrior2.card

arena.battle!
puts warrior1.card
puts warrior2.card

arena1 = BattleArena.new(warrior1, monster1)
arena1.battle!
puts monster1.card

