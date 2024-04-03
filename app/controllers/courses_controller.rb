class CoursesController < ApplicationController

  before_action :get_course, only: [:show, :update, :destroy]

  def index
    @courses = current_user.courses
    render json: @courses
  end

  def show
    render json: @course
  end

  def create
    @course = current_user.courses.build(course_params)
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
    params.require(:course).permit(:name, :url, :description, :duration, :start_date, :expire_date, :priority)
  end
end
