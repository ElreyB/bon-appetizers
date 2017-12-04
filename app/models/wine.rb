class Wine < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  scope :by_name, -> {order(grape: :ASC)}
end
