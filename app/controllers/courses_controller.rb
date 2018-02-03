class CoursesController < ApplicationController
  def index
    @courses = Course.not_started.page(params[:page]).per(10)
  end

  def show
    @course = Course.find(params[:id])
  end
end
