require "rails_helper"
=begin
RSpec.describe CoursesController, type: :routing, skip: true do
  describe "routing" do
    it "routes to #index", skip: true do
      expect(:get => "/courses").to route_to("courses#index")
    end

    it "routes to #show", skip: true do
      expect(:get => "/courses/1").to route_to("courses#show", :id => "1")
    end


    it "routes to #create", skip: true do
      expect(:post => "/courses").to route_to("courses#create")
    end

    it "routes to #update via PUT", skip: true do
      expect(:put => "/courses/1").to route_to("courses#update", :id => "1")
    end

    it "routes to #update via PATCH", skip: true do
      expect(:patch => "/courses/1").to route_to("courses#update", :id => "1")
    end

    it "routes to #destroy", skip: true do
      expect(:delete => "/courses/1").to route_to("courses#destroy", :id => "1")
    end
  end
end
=end