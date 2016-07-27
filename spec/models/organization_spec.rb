require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "creates a single pin of V6B 1G8", :vcr do
    o = Organization.create(address: "142 W Hastings St, Vancouver, BC V6B 1G8, Canada")
    result = o.valid?
    expect(o.latitude.round(2)).to eq(49.28)
  end
end
