class CreateAntipastis < ActiveRecord::Migration[5.1]
  def change
    create_table :antipastis do |t|
      t.string :name

      t.timestamps
    end
  end
end
