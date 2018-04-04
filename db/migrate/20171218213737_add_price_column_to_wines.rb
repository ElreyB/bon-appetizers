class AddPriceColumnToWines < ActiveRecord::Migration[5.1]
  def change
    add_column :wines, :price, :integer
  end
end
