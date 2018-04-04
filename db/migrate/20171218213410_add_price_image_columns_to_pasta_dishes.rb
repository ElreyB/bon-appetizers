class AddPriceImageColumnsToPastaDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :pasta_dishes, :price, :integer
    add_attachment :pasta_dishes, :image
  end
end
