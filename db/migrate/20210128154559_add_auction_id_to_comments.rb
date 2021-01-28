class AddAuctionIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :auction_id, :integer
  end
end
