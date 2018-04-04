class AddPriceImageColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :desserts, :price, :integer
    add_attachment :desserts, :image
  end
end
