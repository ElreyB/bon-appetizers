class AddPriceImageColumnsToMains < ActiveRecord::Migration[5.1]
  def change
    add_column :mains, :price, :integer
    add_attachment :mains, :image
  end
end
