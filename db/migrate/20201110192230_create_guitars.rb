class CreateGuitars < ActiveRecord::Migration[6.0]
  def change
    create_table :guitars do |t|

      t.timestamps
    end
  end
end
