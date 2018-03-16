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
end
