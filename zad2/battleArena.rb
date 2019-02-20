class BattleArena
  attr_reader :character1, :character2

  def initialize(character1, character2)
    @character1 = character1
    @character2 = character2
  end

  def battle!
    character1_strength = @character1.strength
    character2_strength = @character2.strength

    battle_log(@character1.name, @character2.name, character1_strength)
    battle_log(@character2.name, @character1.name, character2_strength)

    if is_draw?(character1_strength, character2_strength)
      puts "It's draw"
      battle!
    elsif character1_strength > character2_strength
      reward_winner(character1, character2)
    else
      reward_winner(character2, character1)
    end
  end

  private

  def battle_log(attacking_character_name, attacked_characker_name, strength)
    puts "#{attacking_character_name} attacked #{attacked_characker_name} with #{strength} damage"
  end

  def reward_winner(winner, looser)
    show_winner(winner.name)
    winner.level_up(looser.level)
  end

  def show_winner(winner_name)
    puts "#{winner_name} wins"
  end

  def is_draw?(character1_strength, character2_strength)
    character1_strength == character2_strength
  end
end