class Player < ApplicationRecord

    before_save :default_values
    def default_values
      self.captain ||= false
    end
    validates :power, :inclusion => 0..99


end
