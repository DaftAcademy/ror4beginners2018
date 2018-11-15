# frozen_string_literal: true

module BestiaryHelper

  def headers
    @monsters.first.keys.map(&:to_s)
  end

  def format_header header
    (header.eql? "id") ? "ID" : default_header_formatter(header)
  end

  private

  def default_header_formatter header
    header.split("_").map(&:capitalize).join(" ")
  end
  
end
