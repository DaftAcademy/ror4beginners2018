class Character
  attr_accessor :name, :level
	
  def initialize(name: , level:)
    self.name= name.class==String ? name: "NoName"
    self.level= (level.class==Integer && level>0 && level<100)? level:1 
  end

  def strength
   level+[*1..12].sample
  end

  def card
    puts "#{name} (#{level} lvl)"
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
	def level_up(a)
		@level=@level+a
	end
end

class BattleArena
  attr_accessor :first,:second
  def initialize(first_character, second_character)
    self.first= first_character.class<=Character ? first_character: Warrior.new(name: 0,level: 0)
    self.second=second_character.class<=Character ? second_character: Warrior.new(name: 0,level: 0)
  end

  def battle!
		strength1=first.strength
		strength2=second.strength

		puts "#{first.name} attacked #{second.name} with #{strength1} damage"

  	puts"#{second.name} attacked #{first.name} with #{strength2} damage"
    
    if strength1 >strength2
     puts "#{first.name} won!"

     if first.class==Warrior 
      first.level_up(1+[0,second.level-first.level].max)
     end

    elsif strength1<strength2
     puts "#{second.name} won!"

     if second.class==Warrior
      second.level_up(1+[0,first.level-second.level].max)
     end
		 
    else
     puts "Draw!"
    end
  end
end

#Test

#Tworzenie postaci
warrior1=Warrior.new(name: 'Po',level: 1)
warrior2=Warrior.new(name: 'Tai Lung', level: 1)
monster=Monster.new(name: 'Skeleton Mage', level: 30)

warrior1.card
warrior2.card
puts warrior1.strength
puts warrior1.strength
monster.card
puts monster.strength
puts "\n\n"

#Arena
arena1=BattleArena.new(warrior1,warrior2)
arena1.battle!
puts "\n\n"

warrior1.card
warrior2.card
puts "\n\n"

arena1.battle!
puts "\n\n"

warrior1.card
warrior2.card
puts "\n\n"

arena2=BattleArena.new(warrior1,monster)
arena2.battle!
puts "\n\n"

monster.card
warrior1.card
