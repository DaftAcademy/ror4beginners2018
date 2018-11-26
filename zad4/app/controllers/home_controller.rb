class HomeController < ApplicationController
 
	def captain 
		@captain = Player.where("captain = true").sample(1)
	end

	def random_players
		@random_players = Player.where("captain = false").sample(10)
	end

	def team
		@team = captain + random_players
	end
  
end
