class BattleArena
  attr_reader :first_character
  attr_reader :second_character

  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_character_strength = @first_character.strength
    second_character_strength = @second_character.strength

    battle_log(@first_character.name, @second_character.name, first_character_strength)
    battle_log(@second_character.name, @first_character.name, second_character_strength)

    if first_character_strength == second_character_strength
      puts "It's draw"
      battle!
    else
      if first_character_strength > second_character_strength
        show_winner(@first_character.name)
        if first_character.is_a? Warrior 
          @first_character.level_up(@second_character.level)
        end
      else
        show_winner(@second_character.name)
        if second_character.is_a? Warrior 
          @second_character.level_up(@first_character.level)
        end
      end
    end
  end

  def battle_log(attacking_character_name, attacked_characker_name, strength)
    puts "#{attacking_character_name} attacked #{attacked_characker_name} with #{strength} damage"
  end

  def show_winner(winner_name)
    puts "#{winner_name} wins"
  end
end