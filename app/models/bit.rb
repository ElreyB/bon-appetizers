class Bit < ActiveRecord::Base
  scope :by_name,-> {order(name: :ASC)}
  validates :name, :uniqueness => true
  validates :name, :presence => true

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.pick_of_the_day
    Bit.all.length > 1 ? Bit.all.sample(2) : Bit.all
  end

end

