require 'rails_helper'

describe Antipasti do

  it { should validate_presence_of :name}
  it { should validate_presence_of :description}
  it { should validate_uniqueness_of :name}

  it "will return 2 samples of Antipasti" do
    antipasti = FactoryBot.create(:antipasti)
    antipasti2 = FactoryBot.create(:antipasti, name: "antipasti2")
    expect(Antipasti.pick_of_the_day).to include antipasti
  end

  it "will return 1 sample of Antipasti" do
    antipasti = FactoryBot.create(:antipasti)
    expect(Antipasti.pick_of_the_day).to include antipasti
  end

  it "will return [] if there are no antipastis" do
    expect(Antipasti.pick_of_the_day).to eq []
  end

end
