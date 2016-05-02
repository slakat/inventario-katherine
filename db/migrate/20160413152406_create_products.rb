class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nature
      t.integer :cost
      t.integer :price
      t.string :state
      t.timestamps
    end
  end
end
