class Style < ApplicationRecord
  belongs_to :menu
  validates :name, uniqueness: true
  validates :name, presence: true
  scope :by_name, -> {order(name: :ASC)}
end
