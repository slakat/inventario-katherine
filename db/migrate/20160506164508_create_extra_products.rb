class CreateExtraProducts < ActiveRecord::Migration
  def change
    create_table :extra_products do |t|
      t.string :name
      t.string :nature
      t.integer :cost
      t.integer :price
      t.string :state
      t.integer :quantity
      t.string :code
      t.references :product
      t.timestamps
    end
  end
end
