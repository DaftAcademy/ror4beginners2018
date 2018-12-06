class ChuckNorrisError < StandardError
  def message
    "poziom postaci musi zawierac sie w przedziale (0,99)"
  end 
end


class Character
  attr_accessor :level , :name

  def initialize(params)
    @name = params[:name]
    if (1..99).include? params[:level]
     @level  = params[:level] 
    else
      raise ChuckNorrisError
    end

  end

  def strength
     [*1..12].sample+ @level  
  end

  def card 
    puts "#{@name} (lvl #{@level})"
  end

end

class Warrior < Character
 
  def lvlup (enemy)
    if @level <99 

      if enemy <= @level 
        @level += 1
      else
        @level = enemy +1
      end
    end
    if enemy == 99 
       @level = enemy
    end
  end

end


class Monster < Character

  def lvlup(enemy)
  end

end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    s1 = @first_character.strength 
    s2 = @second_character.strength
    puts "#{@first_character.name} attacked #{@second_character.name} with #{s1}"
    puts "#{@second_character.name} attacked #{@first_character.name} with #{s2}"
    if s1 > s2
      winner = @first_character
      looser = @second_character   
    else
      winner = @second_character
      looser = @first_character
    end
    winner.lvlup(looser.level)
    puts "#{winner.name} won"

  end
end






