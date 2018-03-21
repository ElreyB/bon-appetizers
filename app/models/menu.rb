class Menu < ActiveRecord::Base
  belongs_to :event
  has_one :style

  scope :menu_styles, ->(menu_style){where("style = ?", menu_style)}
  scope :three_menu, -> {order(created_at: :DESC).limit(3)}

  def inject_or
    style = Style.find(self.style_id)
    if style.name == "The Traditional Italian Dinner with Individually Plated Entrees"
      return self.main_dishes.reduce(Array.new(0)) do |result, dish|
        self.main_dishes.index(dish) == self.main_dishes.length-1 ? result.push(dish) : result.push(dish, "or")
      end
    end
    self.main_dishes
  end

  def update_price
    event = Event.find(self.event_id)
    style_price = Style.find(self.style_id).price
    self.price = style_price * event.number_of_people

  end

end
