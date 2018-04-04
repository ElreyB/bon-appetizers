class DropPastaTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :pastas
  end
end
