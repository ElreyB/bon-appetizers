class AddImageColumnToWines < ActiveRecord::Migration[5.0]
  def change
    add_attachment :wines, :image
  end
end
