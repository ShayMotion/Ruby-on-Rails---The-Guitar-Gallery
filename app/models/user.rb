class User < ApplicationRecord
    has_secure_password
    has_many :guitars 
    has_many :auctions
    # belongs_to :locations
    validates :username, uniqueness: true
    end