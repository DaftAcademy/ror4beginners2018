class Character
  attr_reader :name
  attr_accessor :level
  MIN_LEVEL = 1
  MAX_LEVEL = 99

  def initialize(name:, level: MIN_LEVEL)
    @name = name
    @level = if (level.is_a? Integer) && level.between?(MIN_LEVEL, MAX_LEVEL)
      level
    else
      1
    end
  end

  def strength
    self.level + [*1..12].sample
  end

  def card
    puts "#{name} (lvl #{level})"
  end

  def self.max_level
    MAX_LEVEL
  end

  def level_up(defeated_opponent_level) 
  end

end