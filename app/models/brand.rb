class Brand < ApplicationRecord
    has_many :models
    has_many :vehicle_types, through: :model
end
