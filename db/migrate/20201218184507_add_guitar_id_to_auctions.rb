class AddGuitarIdToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :guitar_id, :integer
  end
end
