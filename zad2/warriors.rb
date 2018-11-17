require_relative 'character'

class Warrior < Character
  def initialize(name: nil, level: MIN_LEVEL)
    super
  end

  def level_up(defeated_opponent_level)  
    level_diff = defeated_opponent_level - level
    if level_diff > 0
      @level += level_diff
    end
    @level += 1	
	@level = [@level, MAX_LEVEL].min
  end
end
