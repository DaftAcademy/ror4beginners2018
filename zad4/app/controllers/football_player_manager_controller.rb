class FootballPlayerManagerController < ApplicationController
  def print_all
    @table = Player.all
  end
end
