class Guitar < ApplicationRecord
    belongs_to :auction
    belongs_to :user
    

    scope :sorted_alphabetically, -> { order(:brand) }
    scope :search, -> (brand) { where("brand like ?", "%#{brand}%")}

    validates :brand, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :price, presence: true
    validates :auction_id, presence: true
    validates_associated :auction
 end

 