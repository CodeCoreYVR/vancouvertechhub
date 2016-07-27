require 'rails_helper'

RSpec.describe Organization, type: :model do
<<<<<<< 855850fb33300992fce36376a9e198c137acf71f
  describe "validations" do
    it "should have reasonable tech team size" do
      o = Organization.new FactoryGirl.attributes_for(:organization).merge({tech_team_size: 1000})
      expect(o).to be_invalid
    end

    it "should have a unique name" do
      o = FactoryGirl.create(:organization)
      o2 = Organization.new FactoryGirl.attributes_for(:organization).merge({name: o.name})
      expect(o2).to be_invalid
    end

    it "should have an address" do
      o = Organization.new FactoryGirl.attributes_for(:organization).merge({address: nil})
      expect(o).to be_invalid
    end

    it "should have an overview" do
      o = Organization.new FactoryGirl.attributes_for(:organization).merge({overview: nil})
      expect(o).to be_invalid
    end

    it "should have employees" do
      o = Organization.new FactoryGirl.attributes_for(:organization).merge({employee_count: 0})
      expect(o).to be_invalid
    end

  it "creates a single pin of V6B 1G8", :vcr do
    o = Organization.create(address: "142 W Hastings St, Vancouver, BC V6B 1G8, Canada")
    result = o.valid?
    expect(o.latitude.round(2)).to eq(49.28)
  end
end
