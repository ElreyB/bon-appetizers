class RemoveAttachmentImageFromMenu < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :menus, :image
  end
end
