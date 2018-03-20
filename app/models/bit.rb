class Bit < ActiveRecord::Base
  scope :by_name,-> {order(name: :ASC)}
  validates :name, :uniqueness => true
  validates :name, :presence => true

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.pick_of_the_day
    samples = []
    i = 2
    until i == samples.length
      bit = Bit.all.sample
      unless samples.include?(bit)
        samples.push(bit)
      end
    end
    samples
  end

end

