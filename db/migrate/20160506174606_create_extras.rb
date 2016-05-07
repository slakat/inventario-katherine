class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.integer :price
      t.integer :quantity
      t.string :nature
      t.string :name
      t.integer :cost
      t.references :extra_product
      t.references :transaction
    end
  end
end
