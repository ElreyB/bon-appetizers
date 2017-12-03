class Wine < ActiveRecord::Base

  scope :by_name, -> {order(grape: :ASC)}
end
