require 'rails_helper'

describe Menu do
  it { should belong_to :event }

  it "will be an Array" do
    menu = Menu.create!()
    expect(menu.desserts).to be_a Array
  end

  context "when style is The Traditional Italian Dinner with Individually Plated Entrees" do
    it "will add 'or' between main dishes" do
      menu = Menu.create!()
      menu.style = "The Traditional Italian Dinner with Individually Plated Entrees"
      menu.main_dishes.push("other item", "another item")
      menu.save
      expect(menu.add_or).to eq ["other item", "or", "another item"]
    end
  end

  context "when style is not The Traditional Italian Dinner with Individually Plated Entrees" do
    it "will add 'or' between main dishes" do
      menu = Menu.create!()
      menu.main_dishes.push("other item", "another item")
      menu.save
      expect(menu.add_or).to eq ["other item", "another item"]
    end
  end
end
