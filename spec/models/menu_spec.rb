require 'rails_helper'

describe Menu do
  it { should belong_to :event }
  it { should have_one :style }

  it "will be an Array" do
    menu = Menu.create!()
    expect(menu.desserts).to be_a Array
  end

  context "when style is The Traditional Italian Dinner with Individually Plated Entrees" do
    it "will add 'or' between main dishes" do
      style = FactoryBot.create(:style)
      style.save
      menu = FactoryBot.create(:menu)
      menu.style_id = style.id
      menu.save
      expect(menu.inject_or).to eq ["other item", "or", "another item"]
    end
  end

  context "when style is not The Traditional Italian Dinner with Individually Plated Entrees" do
    it "will not add 'or' between main dishes" do
      style = FactoryBot.create(:style)
      style.name = "Something else"
      style.save
      menu = FactoryBot.create(:menu)
      menu.style_id = style.id
      menu.save
      expect(menu.inject_or).to eq ["other item", "another item"]
    end
  end

  it "will add price to according to menu style" do
    event = FactoryBot.create(:event)
    menu = FactoryBot.create(:menu)
    menu.event_id = event.id
    expect(menu.price).to eq 300.00
  end
end
