require 'rails_helper'

describe Menu do
  it { should belong_to :event }

  it "will be an Array" do
    menu = Menu.create!()
    expect(menu.desserts).to be_a Array
  end
end
