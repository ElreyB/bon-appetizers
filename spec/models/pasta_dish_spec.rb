require 'rails_helper'

describe PastaDish do

  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}

  it "will return 2 samples of PastaDish" do
    pasta_dish = FactoryBot.create(:pasta_dish)
    pasta_dish2 = FactoryBot.create(:pasta_dish, name: "pasta_dish2")
    expect(PastaDish.pick_of_the_day).to include pasta_dish
  end

  it "will return 1 sample of pasta_dish" do
    pasta_dish = FactoryBot.create(:pasta_dish)
    expect(PastaDish.pick_of_the_day).to include pasta_dish
  end

  it "will return [] if there are no pasta_dishs" do
    expect(PastaDish.pick_of_the_day).to eq []
  end
end
