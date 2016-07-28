require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "creates a single pin of V6B 1G8", :vcr do
    o = Organization.create FactoryGirl.attributes_for(:organization).merge({address: "142 W Hastings St, Vancouver, BC V6B 1G8, Canada" })
    expect(o.latitude.round(2)).to eq(49.28)
  end

  it "doesn't create a pin with invalid address", :vcr do
    o = Organization.create FactoryGirl.attributes_for(:organization).merge({address: "invalid address" })
    expect(o.latitude).not_to be
  end
end
