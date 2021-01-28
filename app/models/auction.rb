class Auction < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :location, optional: true
    has_many :guitars
    has_many :drums
    has_many :brasses
    has_many :djs
    has_many :comments

    # validates :title, :user, :location, presence: true 
    # validates :start_date, :end_date, presence: true
end