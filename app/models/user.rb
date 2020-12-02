class User < ApplicationRecord

    has_secure_password

    has_many :favorites
    has_many :models, through: :favorites
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :username, uniqueness: true

end
