class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @course = Course.new
  end

  def show
  end

  def edit
  end

  def create
    @course = current_user.courses.create(course_params)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(
      :name,
      :time_spent,
      :completed,
      :date,
      :student_id
    )
  end
end
