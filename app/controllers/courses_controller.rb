class CoursesController < ApplicationController

  before_action :get_course, only: [:show, :update, :destroy]

  def index
    @courses = current_user.courses.order(:priority)
    render json: @courses
  end

  def sort
    params[:ids].each_with_index do |id, index|
      current_user.courses.find(id).update(priority: index + 1)
    end
    head :ok
  end

  def show
    render json: @course
  end

  def create
    @course = current_user.courses.build(course_params)
    @course.priority = Course.highest_priority + 1
    if @course.save
      render json: @course
    else
      render json: { errors: @course.errors }, status: :unprocessable_entity
    end
  end

  def update
    @course = current_user.courses.find(params[:id])
    if @course.update(course_params)
      render json: @course
    else
      render json: { errors: @course.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    render json: {message: "Course deleted"}
  end

  private

  def get_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :url, :description, :duration, :start_date, :expire_date)
  end
end
