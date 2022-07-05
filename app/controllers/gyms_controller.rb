class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  
  def index
    gyms = Gym.all
    render json: gyms, status: :ok
  end

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok
  end

  def update
    gym = Gym.find(params[:id])
    gym.update!(gym_params)
    render json: gym, status: :ok
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  end


  private
  
  def render_not_found
    render json: {error: "Record not found"}, status: :not_found
  end

  def gym_params
    params.permit(:name, :address)
  end

  def render_invalid(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
