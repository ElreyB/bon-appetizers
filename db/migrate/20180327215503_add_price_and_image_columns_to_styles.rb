class AddPriceAndImageColumnsToStyles < ActiveRecord::Migration[5.1]
  def change
    add_column :styles, :description, :text
    add_attachment :styles, :image
  end
end
