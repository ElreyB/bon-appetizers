class RemovePriceColumnFromMenus < ActiveRecord::Migration[5.1]
  def change
    remove_column :menus, :price
  end
end
