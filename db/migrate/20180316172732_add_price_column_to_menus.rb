class AddPriceColumnToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :price, :decimal, :precision => 8, :scale => 2
  end
end
