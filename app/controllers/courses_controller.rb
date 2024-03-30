class CoursesController < ApplicationController

  before_action :get_course, only: [:show, :update, :destroy]

  def index
    courses = Course.all
    render json: courses
  end

  def show
    render json: @course
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course
    else
      render json: course.errors
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors
    end
  end

  def destroy
    @course.destroy
    render json: {message: "Course deleted"}
  end

  private

  def get_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :url, :duration, :start_date, :priority)
  end
end
