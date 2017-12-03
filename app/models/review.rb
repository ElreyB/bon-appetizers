class Review < ActiveRecord::Base
  belongs_to :event

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :reviewer, presence: true
  validates :body, presence: true, length: { minimum: 5}
end
