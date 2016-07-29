require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe '#search' do
    context "filter search results based on search queries" do
      it "returns the correct results for a 1 query search"
      it "returns the correct results for a 2 query search"
      it "returns the correct results for a 3 query search"
    end

    context "do not filter search results when the ajax request sends no queries" do

      it "returns all organizations for a request with no queries" do
        orgs = Organization.all
        get :search, {:term => "", :size => "0", :tech => ""}
        puts "The @result value is #{response.body}"
        expect(response.body).to eq(orgs.to_json)
      end

    end

  end

end
