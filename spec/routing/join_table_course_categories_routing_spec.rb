require "rails_helper"

RSpec.describe JoinTableCourseCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/join_table_course_categories").to route_to("join_table_course_categories#index")
    end

    it "routes to #show" do
      expect(:get => "/join_table_course_categories/1").to route_to("join_table_course_categories#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/join_table_course_categories").to route_to("join_table_course_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/join_table_course_categories/1").to route_to("join_table_course_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/join_table_course_categories/1").to route_to("join_table_course_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/join_table_course_categories/1").to route_to("join_table_course_categories#destroy", :id => "1")
    end
  end
end
