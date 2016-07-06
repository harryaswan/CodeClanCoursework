class Country < ApplicationRecord
    belongs_to :continent
    has_many :cities
end
