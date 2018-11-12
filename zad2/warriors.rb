class Character
  attr_accessor :name, :level
  def initialize(name: , level:)
    @name = name
    @level = valid_level(level)
  end

  def strength
    @level + [*1..12].sample
  end
  
  #we make sure that level is in range 1..99
  def valid_level(lvl)
    lvl.between?(1,99) ? lvl : (lvl > 99 ? 99 : 1)
  end

  def card
    puts("#{@name}, lvl #{@level}")
  end

end

class Warrior < Character
  def points(p)
    #level increases only if the opponent's level was lower
    if p > 0 
      @level = valid_level(@level + p)
    end
  end
end

class Monster < Character
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
    puts("A fight between #{@first_character.name} and #{@second_character.name}")
  end

  def battle!
    puts("#{@first_character.name} attacked #{@second_character.name} with #{att1 = @first_character.strength} damage.")
    puts("#{@second_character.name} attacked #{@first_character.name} with #{att2 = @second_character.strength} damage.")
    att1 == att2 ? puts("Draw.") : (att1 > att2 ? winner(@first_character, @second_character) : winner(@second_character, @first_character))
  end

  def winner(win_char, lose_char)
    puts("#{win_char.name} won.")
    if win_char.is_a? Warrior 
      win_char.points(1+lose_char.level-win_char.level)
    end
  end

end

warrior1 = Warrior.new(name: 'Po', level:  16)
warrior2 = Warrior.new(name: 'Tai Lung', level: 17)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(warrior1, monster1)
arena.battle!

warrior1.card 
warrior2.card 
monster1.card

arena = BattleArena.new(warrior1, warrior2)
arena.battle!

warrior1.card 
warrior2.card 
monster1.card

sleep(10)