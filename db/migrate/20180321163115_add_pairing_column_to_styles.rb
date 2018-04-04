class AddPairingColumnToStyles < ActiveRecord::Migration[5.0]
  def change
    add_column :styles, :pairing, :decimal, :precision => 8, :scale => 2
  end
end
