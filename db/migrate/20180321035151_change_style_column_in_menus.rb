class ChangeStyleColumnInMenus < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :style
    add_column :menus, :style_id, :integer
  end
end
