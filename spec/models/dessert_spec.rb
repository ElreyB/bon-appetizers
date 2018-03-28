require 'rails_helper'

describe Dessert do

  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}
  it { should validate_presence_of :description}

  it "will return 2 samples of desserts" do
    dessert = FactoryBot.create(:dessert)
    dessert2 = FactoryBot.create(:dessert, name: "dessert2")
    expect(Dessert.pick_of_the_day).to include dessert
  end

  it "will return 1 sample of dessert" do
    dessert = FactoryBot.create(:dessert)
    expect(Dessert.pick_of_the_day).to include dessert
  end

  it "will return [] if there are no desserts" do
    expect(Dessert.pick_of_the_day).to eq []
  end
end
