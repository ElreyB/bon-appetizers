class AddMenuIdToColumnToStyles < ActiveRecord::Migration[5.1]
  def change
    add_column :styles, :menu_id, :integer
    add_column :events, :menu_id, :integer
  end
end
