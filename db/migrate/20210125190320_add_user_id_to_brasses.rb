class AddUserIdToBrasses < ActiveRecord::Migration[6.0]
  def change
    add_column :brasses, :user_id, :integer
  end
end
