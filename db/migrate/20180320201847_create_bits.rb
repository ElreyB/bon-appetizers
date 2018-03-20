class CreateBits < ActiveRecord::Migration[5.0]
  def change
    create_table :bits do |t|
      t.string :name
      t.attachment :image
    end
  end
end
