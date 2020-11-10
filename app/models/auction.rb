class Auction < ApplicationRecord
    belongs_to :user
    has_many :titles
    has_many :start_dates
    has_many :end_dates
    has_many :guitars
    has_many :brands, through: :guitars
    has_many :models

    validates :name, :user, presence: true 
end