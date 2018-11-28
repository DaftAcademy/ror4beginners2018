class TeamsController < ApplicationController
	def get_random_teams
		@teams = randomize_teams
	end
	
private
	def randomize_teams
		names = Array.new
		2.times { names << "#{Faker::Appliance.unique.equipment} #{Faker::ElderScrolls.unique.city}" }
		Faker::UniqueGenerator.clear
		
		captains = Player.where(captain: true).sample(2)
		players = Player.where(captain: false).sample(20)
		# captains first
		# team1 = players[1...10].insert(0, captains.first).insert(0, names.first)
		# team2 = players[11...20].insert(0, captains.second).insert(0, names.second)
		# captains @ random positions
		team1 = players[1...10].push(captains.first).shuffle!.insert(0, names.first)
		team2 = players[11...20].push(captains.second).shuffle!.insert(0, names.second)
		
		[team1, team2]
	end	
end
