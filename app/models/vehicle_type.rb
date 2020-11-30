class VehicleType < ApplicationRecord
    has_many :models
    has_many :brands, through: :model
end
