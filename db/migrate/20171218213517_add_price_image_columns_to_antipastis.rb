class AddPriceImageColumnsToAntipastis < ActiveRecord::Migration[5.1]
  def change
    add_column :antipastis, :price, :integer
    add_attachment :antipastis, :image
  end
end
