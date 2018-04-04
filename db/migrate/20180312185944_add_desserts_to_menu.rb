class AddDessertsToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :desserts, :text, array:true, default: []
  end
end
