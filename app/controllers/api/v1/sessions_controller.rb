class Api::V1::SessionsController < Api::ApiController

  before_action :set_session, only: %i[show update destroy]

  def index
    @sessions = Session.all.map { |s| session_info(s) }
    render json: @sessions
  end

  def show
    render json: session_info(@session)
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      render json: session_info(@session), status: :created
      # TODO: understand what the following means
      # above line used to have `, location: session_info(@session)`
    else
      render json: readable_errors(@session), status: :unprocessable_entity
    end
  end

  def update
    if @session.update(session_params)
      render json: session_info(@session)
    else
      render json: readable_errors(@session), status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
    render json: { id: @session.id, confirmation: 'Session deleted' }
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:course_id, :session_date, :session_time, :room_id)
  end

end
