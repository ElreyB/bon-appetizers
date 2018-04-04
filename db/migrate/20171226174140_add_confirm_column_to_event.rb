class AddConfirmColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :confirm, :boolean, :default => false
  end
end
