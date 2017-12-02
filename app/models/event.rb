class Event < ActiveRecord::Base
  belongs_to :menu
  has_many :users

end
