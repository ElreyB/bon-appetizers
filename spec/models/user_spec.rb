require 'rails_helper'

describe User do

  it { should have_many :events }
  it { should validate_presence_of :phone }

  it "returns users's full name" do
    user = FactoryBot.create(:user)
    user.update({first_name: "Elrey", last_name: "Belmonti"})
    expect(user.get_fullname).to eq "Elrey Belmonti"
  end

end
