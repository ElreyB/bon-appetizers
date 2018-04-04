require 'rails_helper'

describe Bite do

  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}

  it "will return 2 samples of Bites" do
    bite = FactoryBot.create(:bite)
    bite2 = FactoryBot.create(:bite, name: "bite2")
    expect(Bite.pick_of_the_day).to include bite
  end

  it "will return 1 sample of bite" do
    bite = FactoryBot.create(:bite)
    expect(Bite.pick_of_the_day).to include bite
  end

  it "will return [] if there are no bites" do
    expect(Bite.pick_of_the_day).to eq []
  end
end
