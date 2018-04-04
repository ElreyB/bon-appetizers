class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :guess_id
      t.integer :number_of_people
      t.string :date_and_time

      t.timestamps
    end
  end
end
