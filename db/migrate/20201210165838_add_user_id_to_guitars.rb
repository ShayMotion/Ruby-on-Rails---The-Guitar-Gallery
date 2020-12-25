class AddUserIdToGuitars < ActiveRecord::Migration[6.0]
  def change
    add_column :guitars, :user_id, :integer
  end
end
