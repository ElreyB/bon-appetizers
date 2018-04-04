class AddImageColumnToWines < ActiveRecord::Migration[5.1]
  def change
    add_attachment :wines, :image
  end
end
