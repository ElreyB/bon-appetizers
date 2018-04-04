class RemovePriceColumnFromMenus < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :price
  end
end
