class ScientistsController < ApplicationController
  before_action :set_scientist, only: [:show, :update, :destroy]

  def index
    render json: Scientist.all, status: :ok
  end

  def show
    # scientist = Scientist.find(id: params[:id])
    render json: @scientist, status: :ok, serializer: ScientistWithPlanetsSerializer
  end

  def update
    # scientist = Scientist.find(params[:id])
    scientist.update!(scientist_params)
    render json: @scientist, status: :accepted
  end

  def create
    scientist = Scientist.create!(scientist_params)
    render json: scientist, status: :created
  end

  def destroy
    # scientist = Scientist.find(id: params[:id])
    @scientist.destroy
    @scientist.missions.destroy_all
    head :no_content
  end

  private

  def set_scientist
    @scientist = Scientist.find(params[:id])
  end

  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end
end
