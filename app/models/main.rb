class Main < ActiveRecord::Base
  scope :by_name, -> {order(name: :ASC)}
end
