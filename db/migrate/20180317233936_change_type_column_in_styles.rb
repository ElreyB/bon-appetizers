class ChangeTypeColumnInStyles < ActiveRecord::Migration[5.1]
  def change
    rename_column :styles, :type, :name
  end
end
