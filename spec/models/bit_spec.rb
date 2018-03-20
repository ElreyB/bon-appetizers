require 'rails_helper'

describe Bit do

  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}

  it "will return 2 samples of Bits" do
    bit = FactoryBot.create(:bit)
    bit2 = FactoryBot.create(:bit, name: "bit2")
    expect(Bit.pick_of_the_day).to include bit
  end

  it "will return 1 sample of bit" do
    bit = FactoryBot.create(:bit)
    expect(Bit.pick_of_the_day).to include bit
  end

  it "will return [] if there are no bits" do
    expect(Bit.pick_of_the_day).to eq []
  end
end
