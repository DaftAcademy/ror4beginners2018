class Player < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :power, numericality: { greater_than: 0 }
    validates :power, numericality: { less_than: 100 }
    #te dwa ostatnie połączyć w jeden
end
