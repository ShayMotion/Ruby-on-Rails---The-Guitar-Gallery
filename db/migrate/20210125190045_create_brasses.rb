class CreateBrasses < ActiveRecord::Migration[6.0]
  def change
    create_table :brasses do |t|
      t.string :title

      t.timestamps
    end
  end
end
