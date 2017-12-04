class AddImageColumnToMenus < ActiveRecord::Migration[5.0]
  def change
    add_attachment :menus, :image
  end
end
