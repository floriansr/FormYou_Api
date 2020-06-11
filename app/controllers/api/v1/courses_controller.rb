class Api::V1::CoursesController < Api::ApiController

  before_action :set_course, only: %i[show update destroy]

  def index
    @courses = Course.all.map { |course| course_info(course) }
    render json: @courses
  end

  def show
    render json: course_info(@course)
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: course_info(@course), status: :created # , location: @course
      # TODO: understand what location means and decide whether to get rid of it or do sth else
    else
      render json: readable_errors(@course), status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: course_info(@course)
    else
      render json: readable_errors(@course), status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    render json: { id: @course.id, confirmation: 'Course deleted' }
  end

  private

  def set_course
    @course = Course.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Record not found', message: 'The course ID you provided is invalid.' }
  end

  def course_params
    params.require(:course).permit(:title, :instructor_id)
  end

  def course_info(course)
    course.attributes
          .merge(instructor: course.instructor)
          .merge(categories: course.categories)
  end

  def errors_response(course)
    { error: 'Invalid course params', message: course.errors }
  end

end
