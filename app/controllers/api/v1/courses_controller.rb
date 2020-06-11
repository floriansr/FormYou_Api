class Api::V1::CoursesController < Api::ApiController

  before_action :set_course, only: %i[show sessions update destroy]

  def index
    @courses = Course.all.map { |course| course_info(course) }
    render json: @courses
  end

  def sessions
    render json: @course.sessions.map { |s| session_info(s) }
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
    id = params[:id] || params[:course_id]
    @course = Course.find(id)
    puts @course
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
          .merge(session: course.sessions.map { |s| session_info(s) })
  end

  def errors_response(course)
    { error: 'Invalid course params', message: course.errors }
  end

end
