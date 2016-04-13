class AddColumnsForMigrations < ActiveRecord::Migration
  def change
    add_reference :categories, :product, index:true

    add_reference :formulas, :category, index:true, unique:true

  end
end
