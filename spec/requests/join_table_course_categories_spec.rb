require 'rails_helper'

RSpec.describe "JoinTableCourseCategories", type: :request do
  describe "GET /join_table_course_categories" do
    it "works! (now write some real specs)" do
      get join_table_course_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
