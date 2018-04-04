class CreateMain < ActiveRecord::Migration[5.0]
  def change
    create_table :mains do |t|
      t.string :name

      t.timestamps
    end
  end
end
