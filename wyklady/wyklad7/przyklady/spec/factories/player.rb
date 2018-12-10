FactoryBot.define do
  factory(:player) do
    sequence :first_name do |i|
      "asd_#{i}"
    end
    last_name { 'qwe' }
    power { 50 }
    captain { true }
    trait :powerful_captain do
      power { 99 }
      captain { true }
    end
  end
end
