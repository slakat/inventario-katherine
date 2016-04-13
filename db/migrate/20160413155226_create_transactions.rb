class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :total

      t.timestamps null: false
    end
  end
end
