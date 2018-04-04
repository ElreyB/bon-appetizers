class CreatePastaDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :pasta_dishes do |t|
      t.string :name
      t.timestamps
    end
  end
end
