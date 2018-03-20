class AddDatetimeToBits < ActiveRecord::Migration[5.0]
  def change
    drop_table :bits

    create_table :bits do |t|
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
