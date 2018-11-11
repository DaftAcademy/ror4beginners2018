load "character.rb"

class Monster < Character
  @@MAX_LEVEL = 99;

  def initialize(params = {})
    super(params.fetch(:name, Faker::Pokemon.name), params.fetch(:level, Faker::Number.between(1, @@MAX_LEVEL)))
  end
end