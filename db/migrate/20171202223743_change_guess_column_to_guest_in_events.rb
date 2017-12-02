class ChangeGuessColumnToGuestInEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :guess_id, :guest_id
  end
end
