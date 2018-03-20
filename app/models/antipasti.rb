class Antipasti < ActiveRecord::Base
  scope :by_name, -> {order(name: :ASC)}

  validates :name, :description, :presence => true
  validates :name, :uniqueness => true

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.pick_of_the_day
    Antipasti.all.length > 1 ? Antipasti.all.sample(2) : Antipasti.all
  end

end
