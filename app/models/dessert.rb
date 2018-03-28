class Dessert < ActiveRecord::Base
  scope :by_name, -> {order(name: :ASC)}

  validates :name, uniqueness: true
  validates :name, :description, presence: true

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.pick_of_the_day
    Dessert.all.length > 1 ? Dessert.all.sample(2) : Dessert.all
  end
end
