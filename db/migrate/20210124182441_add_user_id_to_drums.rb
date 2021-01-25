class AddUserIdToDrums < ActiveRecord::Migration[6.0]
  def change
    add_column :drums, :user_id, :integer
  end
end
