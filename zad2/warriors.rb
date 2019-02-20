require_relative 'character'

class Warrior < Character

  def level_up(defeated_opponent_level)  
    new_level = @level + 1
    if defeated_opponent_level > level
      new_level += defeated_opponent_level - level
    end
	  @level = new_level.clamp(MIN_LEVEL, MAX_LEVEL)
  end
end
