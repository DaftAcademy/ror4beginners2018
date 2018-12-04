# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    sequence(:first_name) { |i| "first_name_#{i}" }
    sequence(:last_name) { |i| "last_name_#{i}" }
    power { 50 }
    captain { false }
  end
end
