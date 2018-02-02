class CoursesController < ApplicationController
  def index
    @courses = Course.not_started.page(params[:page]).per(10)
  end

  def show

  end
end
