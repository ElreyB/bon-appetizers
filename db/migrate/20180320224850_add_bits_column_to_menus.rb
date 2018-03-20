class AddBitsColumnToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :bits, :text, array:true, default: []
  end
end
