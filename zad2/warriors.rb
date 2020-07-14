class Character
  attr_reader :name
  attr_accessor :level

  def initialize(name:, level:)
    @name = name
    @level = level.between?(1, 99) ? level : 1
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "#{@name} (lvl #{@level})"
  end
end


class Warrior < Character
end

class Monster < Character
end

class BattleArena
  attr_accessor :first_character, :second_character

  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
    @first_character_dmg = @first_character.strength
    @second_character_dmg = @second_character.strength
  end

  def battle!
    puts "#{@first_character.card} attacked #{@second_character.card} with #{@first_character_dmg} damage"
    puts "#{@second_character.card} attacked #{@first_character.card} with #{@second_character_dmg} damage"
    compare_dmg
  end

  private
  
  def compare_dmg
    if @first_character_dmg === @second_character_dmg
      puts "It's a draw"
    else
      winner = @first_character_dmg > @second_character_dmg ? @first_character : @second_character
      loser = winner.name === @first_character.name ? @second_character : @first_character
      puts "#{winner.name} won"
      level_up(winner, loser)
    end
  end

  def level_up(winner, loser)
    level_diff = loser.level - winner.level
    if (winner.instance_of? Warrior) && level_diff >= 0
      winner.level += level_diff + 1
      puts "#{winner.name} is now at level #{winner.level}"
    end
  end
end

warrior1 = Warrior.new(name: 'Po', level:  12)
warrior2 = Warrior.new(name: 'Tai Lung', level: 12)
monster1 = Monster.new(name: 'Skeleton Mage', level: 15)

arena = BattleArena.new(warrior1, warrior2)
arena.battle!

arena2 = BattleArena.new(warrior2, monster1)
arena2.battle!
