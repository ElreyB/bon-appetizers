class Bite < ActiveRecord::Base
  scope :by_name,-> {order(name: :ASC)}
  validates :name, uniqueness: true
  validates :name, presence: true

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", small: "250x250", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.pick_of_the_day
    Bite.all.length > 1 ? Bite.all.sample(2) : Bite.all
  end

end

