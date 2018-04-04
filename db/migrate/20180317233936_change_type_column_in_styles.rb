class ChangeTypeColumnInStyles < ActiveRecord::Migration[5.0]
  def change
    rename_column :styles, :type, :name
  end
end
