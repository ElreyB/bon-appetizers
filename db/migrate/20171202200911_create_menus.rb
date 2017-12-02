class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.integer :event_id
      t.string :style
      t.integer :price
      t.string :antipasti
      t.string :pasta
      t.string :main_dish
      t.string :dessert
      t.string :wine

      t.timestamps
    end
  end
end
