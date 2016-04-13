class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.integer :quantity
    end
  end
end
