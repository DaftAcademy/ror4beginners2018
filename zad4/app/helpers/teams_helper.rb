module TeamsHelper
  def team_name
    "#{Faker::ElderScrolls.city} #{Faker::ElderScrolls.creature.pluralize}"
  end
end
