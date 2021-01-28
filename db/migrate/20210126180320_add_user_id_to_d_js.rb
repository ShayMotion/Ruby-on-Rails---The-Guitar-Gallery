class AddUserIdToDJs < ActiveRecord::Migration[6.0]
  def change
    add_column :djs, :user_id, :integer
  end
end
