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
    style = Style.find(self.style_id)
    menu_price = style.price.to_f * event.number_of_people
    tax_and_gratuity = menu_price * 0.30
    if self.wine
      return self.price = menu_price  + tax_and_gratuity + style.pairing
    end
    self.price = menu_price  + tax_and_gratuity
  end

  def style_name
    Style.find(self.style_id).name
  end

end
