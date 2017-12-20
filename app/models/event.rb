class Event < ActiveRecord::Base
  has_many :menus
  has_many :reviews
  belongs_to :user

  validates :number_of_people, presence: true, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 50 }

  scope :user_events, ->(user_id){ where("user_id = ?", user_id)}

  # before_save :before_parse, :parse_date_and_time

  def parse_datetime
    time = Time.parse(self.date_and_time)
    time.strftime("%-m/%-d/%Y %I:%M %p %Z")
  end

  def before_parse
    self.date_and_time
  end
end
