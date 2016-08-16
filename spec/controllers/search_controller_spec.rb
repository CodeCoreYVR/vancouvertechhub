require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe '#search' do

    let(:tech2) { FactoryGirl.create(:technology, name: 'tech2') }
    let(:techs) { [FactoryGirl.create(:technology, name: 'tech1'), tech2] }
    let(:techs2) { [FactoryGirl.create(:technology, name: 'tech3'), tech2] }
    let!(:organization_1) { FactoryGirl.create(:fixed_address_published_organization, name: "test organization", tech_team_size: 10, employee_count: 20, technologies: techs) }
    let!(:organization_2) { FactoryGirl.create(:fixed_address_published_organization, name: "yyyo", tech_team_size: 40, employee_count: 50, technologies: techs2) }

    context "with a one query search" do
      it "returns the correct results for query term 'test', size '0' (default)" do
        get :search, { term: "test", size: Organization::DEFAULT, tech: "" }
        expect(response.body).to eq([organization_1].to_json)
      end

      it "returns the correct results for query size less than 25" do
        get :search, { term: "", size: Organization::LESSTHAN25, tech: "" }
        expect(response.body).to eq([organization_1].to_json)
      end

      it "returns the correct results for query size (default), tech '1'"  do
        tech_id = Technology.find_by_name("tech1")
        get :search, { term: "", size: Organization::DEFAULT, tech: tech_id }
        expect(response.body).to eq([organization_1].to_json)
      end

      it "returns the correct results for query size '0' (default), tech '2'" do
        tech_id = Technology.find_by_name("tech2")
        get :search, { term: "", size: Organization::DEFAULT, tech: tech_id }
        expect(response.body).to eq([organization_1, organization_2].to_json)
      end
    end

    context "with a two query search" do
      it "returns the correct result for query size '1', tech '2'" do
        tech_id = Technology.find_by_name("tech2")
        get :search, { term: "", size: Organization::LESSTHAN25, tech: tech_id }
        expect(response.body).to eq([organization_1].to_json)
      end

      it "returns the correct result for query size '2', tech '3'" do
        tech_id = Technology.find_by_name("tech3")
        get :search, { term: "", size: Organization::LESSTHAN50, tech: tech_id }
        expect(response.body).to eq([organization_2].to_json)
      end
    end

    context "with a 3 query search" do
      it "returns the correct result for query term 'test', size '1', tech '1'" do
        tech_id = Technology.find_by_name("tech1")
        get :search, { term: "test", size: Organization::LESSTHAN25, tech: tech_id }
        expect(response.body).to eq([organization_1].to_json)
      end
    end

    context "do not filter search results when the ajax request sends no queries" do
      it "returns all organizations for a request with no queries" do
        orgs = Organization.all
        get :search, {term: "", size: Organization::DEFAULT, tech: ""}
        expect(response.body).to eq(orgs.to_json)
      end
    end
  end
end
