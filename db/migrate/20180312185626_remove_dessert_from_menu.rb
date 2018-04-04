class RemoveDessertFromMenu < ActiveRecord::Migration[5.1]
  def change
    remove_column :menus, :dessert
  end
end
