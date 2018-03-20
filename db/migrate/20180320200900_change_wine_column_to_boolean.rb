class ChangeWineColumnToBoolean < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :wine
    add_column :menus, :wine, :boolean, default: false
  end
end
