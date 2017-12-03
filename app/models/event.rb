class Event < ActiveRecord::Base
  has_many :menus
  belongs_to :user

  validates :number_of_people, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 50 }

  scope :user_events, ->(user_id){ where("user_id = ?", user_id)}

  before_save :parse_date_and_time

  def parse_date_and_time
    time = Time.parse(self.date_and_time)
    self.date_and_time = time.strftime("%-m/%-d/%Y at %I:%M %p %Z")
  end
end
