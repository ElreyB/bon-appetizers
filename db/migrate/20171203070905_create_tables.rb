class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :antipastis do |t|
      t.string :name

      t.timestamps
    end

    create_table :pastas do |t|
      t.string :name

      t.timestamps
    end

    create_table :main_dishes do |t|
      t.string :name

      t.timestamps
    end

    create_table :desserts do |t|
      t.string :name

      t.timestamps
    end
    
  end
end
