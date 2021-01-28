class AddAuctionIdToDJs < ActiveRecord::Migration[6.0]
  def change
    add_column :djs, :auction_id, :integer
  end
end
