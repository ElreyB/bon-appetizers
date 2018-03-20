class Menu < ActiveRecord::Base
  belongs_to :event



  # has_attached_file :image
  #  validates :image, attachment_presence: true
  #  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # validates :style, uniqueness: true
  # validates :antipasti, uniqueness: true
  # validates :pasta, uniqueness: true
  # validates :main_dish, uniqueness: true
  # validates :dessert, uniqueness: true
  # validates :wine, uniqueness: true

  scope :menu_styles, ->(menu_style){where("style = ?", menu_style)}
  scope :three_menu, -> {order(created_at: :DESC).limit(3)}

  def add_or
    dishes = self.main_dishes
    if self.style == "The Traditional Italian Dinner with Individually Plated Entrees"
      return dishes.reduce(Array.new(0)) do |result, dish|
        dishes.index(dish) == dishes.length-1 ? result.push(dish) : result.push(dish, "or")
      end
    end
    dishes
  end
end
