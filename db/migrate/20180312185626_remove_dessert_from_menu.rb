class RemoveDessertFromMenu < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :dessert
  end
end
