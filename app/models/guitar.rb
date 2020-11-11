class Guitar < ApplicationRecord
    has_many :brands, foreign_key: :guitar_id
    has_many :models
    has_many :years
    has_many :prices
    belongs_to :locations
 end
