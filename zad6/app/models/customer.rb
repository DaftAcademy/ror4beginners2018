class Customer < ApplicationRecord
    has_many :products, dependent: :destroy #w zasadzie nie obchodzą nas produkty klienta którego usuwamy z bazy chyba

    validates :name, presence: true
    validates :email, presence: true
end
