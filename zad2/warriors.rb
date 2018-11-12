class Character
  attr_accessor :name
  attr_accessor :level
  MIN_LEVEL = 1
  MAX_LEVEL = 99

  def initialize(name:, level:)
    raise ArgumentError.new('Level has to be in range <1:99>') if !checkLevel(level)
    self.name = name
    self.level = level
  end

  def strength
    [*1..12].sample + self.level
  end

  def card
    puts "#{self.name} (lvl #{self.level})"
  end

  def checkLevel(level)
    level.between?(1,99)
  end


end

class Warrior < Character
  def add_level(opponent)
    if self.level < opponent.level
      self.level = checkLevel(opponent.level + 1) ? opponent.level + 1 : 99
        
    elsif (self.level == opponent.level)
      self.level = checkLevel(self.level + 1) ? (self.level + 1) : self.level 

    end    
  end
end

class Monster < Character
end

class BattleArena
  attr_accessor :first_character, :second_character

  def initialize(first_character, second_character)
    raise ArgumentError.new('Characters have to be Warriors or Monsters') if !checkCharacter(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end

  def checkCharacter(_first_character , _second_character)
    (_first_character.is_a? Character) && (_second_character.is_a? Character)
  end

  def battle!
    puts "#{first_character.name} attacked #{second_character.name} with #{first_character.strength}"
    puts "#{second_character.name} attacked #{first_character.name} with #{second_character.strength}"

    if first_character.strength > second_character.strength
      puts "#{first_character.name} won"
      (first_character.is_a? Warrior) ? first_character.add_level(second_character) : nil
    

    elsif (second_character.strength > first_character.strength)
      puts "#{second_character.name} won"
      (second_character.is_a? Warrior) ? second_character.add_level(first_character) : nil
    
    else
      puts "Draw!"
    end
  end

end

warrior1 = Warrior.new(name: 'Po', level:  1)
warrior2 = Warrior.new(name: 'Tai Lung', level: 1)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)




warrior1.card # => Po (lvl 1)
warrior1.strength # => 6
warrior1.strength # => 5
warrior2.card # => Tai Lung (lvl 1)
monster1.card # => Skeleton Mage (lvl 15)

arena = BattleArena.new(warrior1, warrior2)
arena.battle!
# ->  Po attacked Tai Lung with 6 damage
# ->  Tai Lung attacked Po with 8 damage
# ->  Tai Lung won

warrior1.card # => Po (lvl 1)
warrior2.card 

#### 3. Powtórzenie walki

arena.battle!

warrior1.card 


#### 4. Stworzenie areny z dwoma walczącym wojownikiem i potworem

arena = BattleArena.new(warrior1, monster1)
arena.battle!


monster1.card 