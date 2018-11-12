class Character
  attr_reader :name
  attr_reader :level
  
  def initialize(name:, level:)
    @name = name
    @level = level
  end

  def card
    "#{name} (lvl #{level})"
  end

  def strength
    [*1..12].sample + self.level
  end
end

class Warrior < Character
  attr_writer :level

  def zwiekszPoziom(ile)
    self.level = self.level + ile
  end
end

class Monster < Character
end

class BattleArena
  attr_reader :first_character
  attr_reader :second_character

  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    sila1 = first_character.strength
    sila2 = second_character.strength

    poziom1 = first_character.level
    poziom2 = first_character.level

    puts "#{first_character.name} attacked #{second_character.name} with #{sila1}"
    puts "#{second_character.name} attacked #{first_character.name} with #{sila2}"
    if sila1 > sila2
      puts "#{first_character.name} won"
      if first_character.is_a? Warrior
        first_character.zwiekszPoziom([1, poziom2-poziom1].max)
      end

    else
      puts "#{second_character.name} won"
      if second_character.is_a? Warrior
        second_character.zwiekszPoziom([1, poziom1-poziom2].max)
      end

    end
  end
end
