class TeamsController < ApplicationController
  def index
  	@captains=Player.where(captain: true).to_a
  	@players=Player.where(captain: false).to_a
  end
end
