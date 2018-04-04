class AddImageColumnToMenus < ActiveRecord::Migration[5.1]
  def change
    add_attachment :menus, :image
  end
end
