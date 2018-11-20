# frozen_string_literal: true

module BestiaryHelper
  def location
    ": #{@location}" if @location 
  end
end
