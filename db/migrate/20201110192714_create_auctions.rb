class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :start_date
      t.string :end_date
      t.integer :location_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
