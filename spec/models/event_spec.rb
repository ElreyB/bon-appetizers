require 'rails_helper'

describe Event do
  it { should belong_to :user }
  it { should have_one :menu }
  it { should validate_numericality_of(:number_of_people).is_less_than_or_equal_to(50)}
  it { should validate_presence_of(:party_for) }
  it { should validate_presence_of(:date_and_time) }
  it { should validate_numericality_of(:number_of_people).is_greater_than_or_equal_to(10)}

  it "returns list of users events" do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    event2 = FactoryBot.create(:event)
    event3 = FactoryBot.create(:event)
    event.update({user_id: user.id})
    event2.update({user_id: user.id})
    expect(Event.user_events(user.id)).to eq [event, event2]
  end


  it "returns list of events within 30days" do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    event2 = FactoryBot.create(:event)
    event3 = FactoryBot.create(:event)
    event.update({date_and_time: Faker::Date.forward(15)})
    event2.update({date_and_time: Faker::Date.forward(20)})
    event3.update({date_and_time: Faker::Date.backward(15)})
    expect(Event.within_30_days).to eq [event, event2]
  end

  describe "#add_review" do
    context "when today's date/time is the same or less than event date/time" do
      it "will return true" do
        event = FactoryBot.create(:event)
        event.update({date_and_time: Faker::Date.between(Date.today,Date.today)})
        expect(event.add_review?).to eq true
      end
    end

    context "when today's date/time is greater than event date/time" do
      it "will return false" do
        event = FactoryBot.create(:event)
        event.update({date_and_time: Faker::Date.forward(10)})
        expect(event.add_review?).to eq false
      end
    end
  end

  describe "#parse_datetime" do
    it "will make DateTime input user friendly" do
      event = FactoryBot.create(:event)
      expect(event.parse_datetime).to eq "1/19/2019 08:08 PM PST"
    end
  end

end
