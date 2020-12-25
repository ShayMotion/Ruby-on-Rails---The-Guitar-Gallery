class Guitar < ApplicationRecord
    belongs_to :auctions
    has_many :brands, foreign_key: :guitar_id
    has_many :models
    has_many :years
    has_many :prices


        validates :auction_id, presence: true
        validates_associated :auction

    # accepts_nested_attributes_for :auction

    def guitar_attributes=(guitar_params)
        Guitar.find_or_create_by(guitar_params)
        if guitar.valid?
        self.guitar = guitar
        end 
    end
 end
