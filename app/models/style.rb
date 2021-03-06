class Style < ApplicationRecord
  belongs_to :menu
  validates :name, uniqueness: true
  validates :name, :description, :price, :pairing, presence: true
  scope :by_name, -> {order(name: :ASC)}

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", small: "250x250", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
