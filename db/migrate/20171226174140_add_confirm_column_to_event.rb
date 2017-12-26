class AddConfirmColumnToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :confirm, :boolean, :default => false
  end
end
