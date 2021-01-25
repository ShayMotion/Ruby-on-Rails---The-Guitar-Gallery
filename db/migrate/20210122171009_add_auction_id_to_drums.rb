class AddAuctionIdToDrums < ActiveRecord::Migration[6.0]
  def change
    add_column :drums, :auction_id, :integer

  end
end
