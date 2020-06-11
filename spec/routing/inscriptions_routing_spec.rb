require "rails_helper"

RSpec.describe InscriptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/inscriptions").to route_to("inscriptions#index")
    end

    it "routes to #show" do
      expect(:get => "/inscriptions/1").to route_to("inscriptions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/inscriptions").to route_to("inscriptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inscriptions/1").to route_to("inscriptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inscriptions/1").to route_to("inscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inscriptions/1").to route_to("inscriptions#destroy", :id => "1")
    end
  end
end
