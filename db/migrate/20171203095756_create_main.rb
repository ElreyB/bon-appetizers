class CreateMain < ActiveRecord::Migration[5.1]
  def change
    create_table :mains do |t|
      t.string :name

      t.timestamps
    end
  end
end
