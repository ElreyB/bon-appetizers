class Event < ActiveRecord::Base
  has_many :menus
  belongs_to :user

  validates :number_of_people, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 50 }

  scope :user_events, ->(user_id){ where("user_id = ?", user_id)}

end
