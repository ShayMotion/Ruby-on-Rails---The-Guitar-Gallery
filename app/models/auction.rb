class Auction < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :guitars

    validates :title, :user, :location, presence: true 
    validates :start_date, :end_date, presence: true
end