class AddDescriptionColumnsToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :antipastis, :description, :text
    add_column :pastas, :description, :text
    add_column :desserts, :description, :text
    add_column :mains, :description, :text
    add_column :pasta_dishes, :description, :text
    add_column :wines, :description, :text
  end
end
