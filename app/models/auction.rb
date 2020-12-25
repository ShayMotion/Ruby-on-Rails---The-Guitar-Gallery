class Auction < ApplicationRecord
    belongs_to :user
    has_many :guitars
    has_many :brands, through: :guitars
    has_many :models, through: :guitars 
    has_many :locations

    validates :title, :user, presence: true 
end