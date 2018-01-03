require 'rails_helper'

describe User do

  it { should have_many :events }

  it "returns users's full name" do
    user = FactoryBot.create(:user)
    user.update({first_name: "Elrey", last_name: "Belmonti"})
    expect(User.get_fullname(user.id)).to eq "Elrey Belmonti"
  end

end
