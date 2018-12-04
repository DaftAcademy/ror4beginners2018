class HomeController < ApplicationController
  def welcome
    @random = rand(10000)
  end
  def who
    @who = request.user_agent
  end
end
