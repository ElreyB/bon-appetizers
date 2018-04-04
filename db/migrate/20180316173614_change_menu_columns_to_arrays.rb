class ChangeMenuColumnsToArrays < ActiveRecord::Migration[5.1]
  def change
    remove_column :menus, :antipasti
    remove_column :menus, :pasta
    remove_column :menus, :main_dish

    add_column :menus, :antipasti, :text, array:true, default: []
    add_column :menus, :pasta, :text, array:true, default: []
    add_column :menus, :main_dish, :text, array:true, default: []
  end
end
