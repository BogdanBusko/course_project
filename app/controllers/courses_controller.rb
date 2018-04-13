class CoursesController < ApplicationController
  before_action :set_course, :set_categories, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.not_started.order_by(created_at: :desc).page(params[:page]).per(10)
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    puts params[:name]

    if @course.save!
      redirect_to publications_url
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @course.update_attributes(course_params)
      redirect_to publications_url
    else
      render 'edit'
    end
  end

  def destroy
    if @course.delete
      redirect_to publications_url
    else
      render 'index'
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :category_id).merge(user_id: current_user.id, confirmed: true)
  end
end
