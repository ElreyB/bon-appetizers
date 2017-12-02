class Menu < ActiveRecord::Base
  belongs_to :event

  validates :style, uniqueness: true
  validates :antipasti, uniqueness: true
  validates :pasta, uniqueness: true
  validates :main_dish, uniqueness: true
  validates :dessert, uniqueness: true
  validates :wine, uniqueness: true

  scope :menu_styles, ->(menu_style){where("style = ?", menu_style)}
end
