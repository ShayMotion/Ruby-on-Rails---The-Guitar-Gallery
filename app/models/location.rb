class Location < ApplicationRecord
 belongs_to :auctions, foreign_key: :auction_id, class_name: "Auction"
end