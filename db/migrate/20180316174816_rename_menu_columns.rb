class RenameMenuColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :menus, :antipasti, :antipastis
    rename_column :menus, :pasta, :pastas
    rename_column :menus, :main_dish, :main_dishes
  end
end
