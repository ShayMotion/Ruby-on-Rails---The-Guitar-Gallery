class User < ApplicationRecord
    has_secure_password
    belongs_to :hometown, class_name: "Location"
    has_many :guitars 

    has_many :auctions
    has_many :brands through :guitars
    has_many :models through :guitars
    has_many :years through :guitars
    has_many :prices through :guitars

    validates :name, :username, :hometown, presence: true
    validates :username, uniqueness: true
end
