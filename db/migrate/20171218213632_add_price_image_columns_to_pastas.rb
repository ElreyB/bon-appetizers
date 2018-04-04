class AddPriceImageColumnsToPastas < ActiveRecord::Migration[5.0]
  def change
    add_column :pastas, :price, :integer
    add_attachment :pastas, :image
  end
end
