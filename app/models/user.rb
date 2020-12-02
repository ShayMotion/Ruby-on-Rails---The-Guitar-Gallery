class User < ApplicationRecord
    has_secure_password
    has_many :guitars 
    has_many :auctions
    validates :username, uniqueness: true
    end