class User < ApplicationRecord
    has_many :favorites
    has_many :models, through: :favorites
    validates :username, presence: true
    validates :password, presence: true
    validates :username, uniqueness: true
end
