class AddAuctionIdToGuitars < ActiveRecord::Migration[6.0]
  def change
    add_column :guitars, :auction_id, :integer
  end
end
