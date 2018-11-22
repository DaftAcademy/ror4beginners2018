module TeamsHelper
  def team_name
    "#{Faker::ElderScrolls.city} #{Faker::ElderScrolls.creature.split.last.pluralize}"
  end
end
