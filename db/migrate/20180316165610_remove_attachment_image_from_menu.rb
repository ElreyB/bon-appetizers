class RemoveAttachmentImageFromMenu < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :menus, :image
  end
end
