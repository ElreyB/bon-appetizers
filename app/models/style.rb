class Style < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  scope :by_name, -> {order(name: :ASC)}
end
