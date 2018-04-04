class CreateDesserts < ActiveRecord::Migration[5.0]
  def change
    create_table :desserts do |t|
      t.string :name

      t.timestamps
    end
  end
end
