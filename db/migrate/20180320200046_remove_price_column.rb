class RemovePriceColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :antipastis, :price
    remove_column :desserts, :price
    remove_column :mains, :price
    remove_column :pasta_dishes, :price
    drop_table :wines
  end
end
