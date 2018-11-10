class Character
  attr_accessor :name, :level

  #Constructor
  def initialize(name:,level:)
    @name = name
    @level = is_valid?(level)
  end

  #Card displays all the attributes of our character
  def card
  puts "#{name} is #{level} level"
  end

  #Strength method calculates the damage dealt value
  def strength
    [*1..12].sample + @level
  end

  protected

  #Finding out if the level is valid (it is supposed to be between 1 and 99)
  def is_valid?(valid_level)
    valid_level.between?(1,99) ? valid_level : @level = 1
  end
end

class Warrior < Character
  #Warrior is the only class able to level up, the method below gives him this possibility
  def lvl_up(winner,loser)
    if winner.level >= loser.level
      winner.level += 1
    else
      winner.level = loser.level - winner.level + 1
    end
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

  #Calling out battle force the characters to fight
  def battle!
    first_dmg = first_character.strength
    second_dmg = second_character.strength

    puts "\n#{first_character.name} attacked #{second_character.name} with #{first_dmg} damage"
    puts "#{second_character.name} attacked #{first_character.name} with #{second_dmg} damage"
    
    #Let's check which character is victorious
    if first_dmg > second_dmg
      winner = first_character

      #Checking if the winner of our fight is a warrior (then lvl him up), it excludes monsters to get exp 
      winner.is_a?(Warrior) ? winner.lvl_up(first_character,second_character) : winner.level = winner.level
      
      #Puts up a message depending on the class
      if winner.is_a? Warrior
        puts "#{winner.name} level increased! Now its #{winner.level}!"
      else
        puts "Seems like #{winner.name} has beaten you... #{winner.name} is  #{winner.level}"
      end
    elsif second_dmg > first_dmg
      winner = second_character

      winner.is_a?(Warrior) ? winner.lvl_up(second_character, first_character) : winner.level = winner.level  

      if winner.is_a? Warrior
        puts "#{winner.name} level increased! Now its #{winner.level}!"
      else
        puts "Seems like #{winner.name} has beaten you... #{winner.name} is #{winner.level} level."
      end
    else 
      puts 'Seems like no one will win this time...' 
    end

  end
end

#Tests:
## Characters
warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

## 1st round
puts "--Lets fight! First round!--"
arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts "~~Results~~"
warrior1.card 
warrior2.card

## 2nd round
puts "\n--Lets fight! Second round!--"
arena = BattleArena.new(warrior1, warrior2)
arena.battle!
puts "~~Results~~"
warrior1.card
warrior2.card

## 3rd round
puts "\n--Lets see if you can deal with a monster! Third round!--"
arena = BattleArena.new(warrior1, monster1)
arena.battle!
puts "~~Results~~"
warrior1.card
monster1.card

##Final results
puts "\n~~~~Results of the whole game~~~~"
warrior1.card
monster1.card
warrior2.card