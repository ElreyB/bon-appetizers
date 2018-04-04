class AddPriceColumnToWines < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :price, :integer
  end
end
