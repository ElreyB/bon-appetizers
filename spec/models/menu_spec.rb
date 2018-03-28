require 'rails_helper'

describe Menu do
  it { should belong_to :event }
  it { should have_one :style }

  it "will be an Array" do
    event = FactoryBot.create(:event)
    menu = FactoryBot.create(:menu)
    menu.event_id = event.id
    expect(menu.desserts).to be_a Array
  end

  describe '#inject_or' do
    context "when style is The Traditional Italian Dinner with Individually Plated Entrees" do
      it "will add 'or' between main dishes" do
        event = FactoryBot.create(:event)
        style = FactoryBot.create(:style)
        menu = FactoryBot.create(:menu)
        menu.style_id = style.id
        menu.event_id = event.id
        menu.save
        expect(menu.inject_or).to eq ["other item", "or", "another item"]
      end
    end

    context "when style is not The Traditional Italian Dinner with Individually Plated Entrees" do
      it "will not add 'or' between main dishes" do
        event = FactoryBot.create(:event)
        style = FactoryBot.create(:style)
        style.name = "Something else"
        style.save
        menu = FactoryBot.create(:menu)
        menu.event_id = event.id
        menu.style_id = style.id
        menu.save
        expect(menu.inject_or).to eq ["other item", "another item"]
      end
    end
  end

  describe '#update_price' do
    it "will add price to according to menu style" do
      event = FactoryBot.create(:event)
      style = Style.create!(name: "HORS D’OEUVRES", price: 25.00, pairing: 12.00, description: "words")
      menu = FactoryBot.create(:menu)
      menu.event_id = event.id
      menu.style_id = style.id
      menu.update_price
      menu.save
      expect(menu.price).to eq 390.00
    end

    it "will add price to according to menu style with pairing" do
      event = FactoryBot.create(:event)
      style = Style.create!(name: "HORS D’OEUVRES", price: 25.00, pairing: 12.00, description: "words")
      menu = FactoryBot.create(:menu)
      menu.event_id = event.id
      menu.style_id = style.id
      menu.wine = true
      menu.update_price
      menu.save
      expect(menu.price).to eq 402.00
    end
  end

  describe "#style_name" do
    it "will return menu style name" do
      event = FactoryBot.create(:event)
      style = Style.create!(name: "HORS D’OEUVRES", price: 25.00, pairing: 12.00, description: "words")
      menu = FactoryBot.create(:menu)
      menu.event_id = event.id
      menu.style_id = style.id
      menu.update_price
      menu.save
      expect(menu.style_name).to eq "HORS D’OEUVRES"
    end
  end

end
