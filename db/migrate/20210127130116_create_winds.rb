class CreateWinds < ActiveRecord::Migration[6.0]
  def change
    create_table :winds do |t|
      t.string :title
      t.timestamps
    end
  end
end
