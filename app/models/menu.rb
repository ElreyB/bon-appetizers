class Menu < ActiveRecord::Base
  has_many :events
  scope :menu_styles, ->(menu_style){where("style = ?", menu_style)}
end
