class CreateTransactionService < ActiveRecord::Migration
  def change
    create_table :transaction_products do |t|
      t.integer :price
      t.string :name
      t.references :transaction
      t.references :product
      t.integer :quantity
    end
  end
end
