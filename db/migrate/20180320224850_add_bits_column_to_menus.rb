class AddBitesColumnToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :bites, :text, array:true, default: []
  end
end
