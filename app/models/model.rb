class Model < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    belongs_to :brand
    belongs_to :vehicle_type
end
