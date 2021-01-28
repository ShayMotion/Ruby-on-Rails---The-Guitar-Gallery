class Location < ApplicationRecord
 has_many :auctions
 has_many :users, through: :auctions 

end