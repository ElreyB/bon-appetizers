class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :event_id
      t.integer :rating
      t.string :reviewer
      t.string :body

      t.timestamps
    end
  end
end
