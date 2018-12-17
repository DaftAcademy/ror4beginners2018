class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    battle_result (@first_character.attack @second_character), (@second_character.attack @first_character)
  end

  private
  def battle_result first_damage, second_damage
    first_damage == second_damage ? draw : first_damage > second_damage ? first_character_won : second_character_won
  end

  def first_character_won
    @first_character.levelUp @second_character.level if @first_character.is_a? Warrior
    winer @first_character
  end

  def second_character_won
    @second_character.levelUp @first_character.level if @second_character.is_a? Warrior
    winer @second_character
  end

  def winer character
    puts "#{character.name} won!"
  end

  def draw
    puts "DRAW!"
  end
end