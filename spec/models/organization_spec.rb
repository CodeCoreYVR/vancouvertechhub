require 'rails_helper'

RSpec.describe Organization, type: :model do
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
    it "requires the employee count to be greater than or equal to 1" do
      o = Organization.new employee_count: 5
      o.valid?
      expect(o.errors).to have_key(:employee_count)
    end

    it "requires the tech team size to be greater than or equal to 0" do
      o = Organization.new tech_team_size: 5
      o.valid?
      expect(o.errors).to have_key(:tech_team_size)
    end
  end
end
