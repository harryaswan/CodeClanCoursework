class Continent < ApplicationRecord
    has_many :countries
    has_many :cities, {through: :countries}
end
