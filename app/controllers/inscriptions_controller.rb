class InscriptionsController < ApplicationController

  before_action :set_inscription, only: %i[show update destroy]

  # GET /inscriptions
  def index
    @inscriptions = Inscription.all

    render json: @inscriptions
  end

  # GET /inscriptions/1
  def show
    render json: @inscription
  end

  # POST /inscriptions
  def create
    @inscription = Inscription.new(inscription_params)

    if @inscription.save
      render json: @inscription, status: :created, location: @inscription
    else
      render json: @inscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inscriptions/1
  def update
    if @inscription.update(inscription_params)
      render json: @inscription
    else
      render json: @inscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inscriptions/1
  def destroy
    @inscription.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def inscription_params
    params.require(:inscription).permit(:session_id, :student_id, :note)
  end

end
