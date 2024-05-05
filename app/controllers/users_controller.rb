class UsersController < ApplicationController

  before_action :check_current_user_id, only: [:update]

  def update
    if current_user.update(user_params)
      render json: current_user.slice(:id, :name, :slots, :timer_duration)
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def check_current_user_id
    if current_user.id != params[:id].to_i
      render json: { errors: { base: ["You can only update current user"] } }, status: :unauthorized
    end
  end

  def user_params
    params.permit(:name, :timer_duration, slots: [])
  end
end
