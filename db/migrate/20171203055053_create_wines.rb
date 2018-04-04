class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :grape

      t.timestamps
    end
  end
end
