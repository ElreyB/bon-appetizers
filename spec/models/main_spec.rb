require 'rails_helper'

describe Main do

  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}

  it "will return 2 samples of mains" do
    main = FactoryBot.create(:main)
    main2 = FactoryBot.create(:main, name: "main2")
    expect(Main.pick_of_the_day).to include main
  end

  it "will return 1 sample of main" do
    main = FactoryBot.create(:main)
    expect(Main.pick_of_the_day).to include main
  end

  it "will return [] if there are no mains" do
    expect(Main.pick_of_the_day).to eq []
  end
end
