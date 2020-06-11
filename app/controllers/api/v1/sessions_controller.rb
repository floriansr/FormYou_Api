class Api::V1::SessionsController < Api::ApiController

  before_action :set_session, only: %i[show update destroy]

  def index
<<<<<<< HEAD
    @sessions = Session.all

=======
    @sessions = Session.all.map { |s| session_info(s) }
>>>>>>> 285ea0d... [controller]
    render json: @sessions
  end

  def show
    render json: @session
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      render json: session_info(@session), status: :created
      # TODO: understand what the following means
      # above line used to have `, location: session_info(@session)`
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:course_id, :session_date, :session_time, :room_id)
  end

<<<<<<< HEAD
=======
  def session_availability(session)
    # TODO: change 20 to a class constant
    # current difficulty: constant isn't regonized
    # to reproduce, set a Session class constant, call here, see rails server
    { "availability": (20 - session.students.count) }
  end

  def session_info(session)
    session.attributes.merge(session_availability(session))
  end

>>>>>>> 285ea0d... [controller]
end
