class User < ApplicationRecord
    has_many :appointments
    has_many :pets, through: :appointments
    has_secure_password
end