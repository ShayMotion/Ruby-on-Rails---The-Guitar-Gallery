class AddAuctionIdToBrasses < ActiveRecord::Migration[6.0]
  def change
    add_column :brasses, :auction_id, :integer
  end
end
