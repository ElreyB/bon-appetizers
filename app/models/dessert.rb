class Dessert < ActiveRecord::Base
  scope :by_name, -> {order(name: :ASC)}

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.jpg"
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
