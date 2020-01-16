require "rails_helper"

RSpec.describe DisbursementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/disbursements").to route_to("disbursements#index")
    end

    it "routes to #new" do
      expect(:get => "/disbursements/new").to route_to("disbursements#new")
    end

    it "routes to #show" do
      expect(:get => "/disbursements/1").to route_to("disbursements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/disbursements/1/edit").to route_to("disbursements#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/disbursements").to route_to("disbursements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/disbursements/1").to route_to("disbursements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/disbursements/1").to route_to("disbursements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/disbursements/1").to route_to("disbursements#destroy", :id => "1")
    end
  end
end
