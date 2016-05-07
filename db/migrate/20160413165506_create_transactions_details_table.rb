class CreateTransactionsDetailsTable < ActiveRecord::Migration
  def change
    create_table :transaction_services do |t|
      t.integer :price
      t.string :name
      t.references :transaction
      t.references :service
    end
  end
end
