class JoinTableCourseCategoriesController < ApplicationController

  before_action :set_join_table_course_category, only: %i[show update destroy]

  # GET /join_table_course_categories
  def index
    @join_table_course_categories = JoinTableCourseCategory.all

    render json: @join_table_course_categories
  end

  # GET /join_table_course_categories/1
  def show
    render json: @join_table_course_category
  end

  # POST /join_table_course_categories
  def create
    @join_table_course_category = JoinTableCourseCategory.new(join_table_course_category_params)

    if @join_table_course_category.save
      render json: @join_table_course_category, status: :created, location: @join_table_course_category
    else
      render json: @join_table_course_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /join_table_course_categories/1
  def update
    if @join_table_course_category.update(join_table_course_category_params)
      render json: @join_table_course_category
    else
      render json: @join_table_course_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /join_table_course_categories/1
  def destroy
    @join_table_course_category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_join_table_course_category
    @join_table_course_category = JoinTableCourseCategory.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def join_table_course_category_params
    params.require(:join_table_course_category).permit(:course_id, :category_id)
  end

end
