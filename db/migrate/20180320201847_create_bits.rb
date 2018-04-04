class CreateBites < ActiveRecord::Migration[5.0]
  def change
    create_table :bites do |t|
      t.string :name
      t.attachment :image
    end
  end
end
