class Guitar < ApplicationRecord
    belongs_to :auctions
    has_many :brands, foreign_key: :guitar_id
    has_many :models
    has_many :years
    has_many :prices


        validates :auction_id, presence: true
        validates_associated :auction
 end
