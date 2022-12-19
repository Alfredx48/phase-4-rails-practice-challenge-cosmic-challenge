class MissionsController < ApplicationController

  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  def mission_params
    params.permit(:scientist_id, :planet_id, :name)
  end

end
