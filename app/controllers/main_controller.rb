class MainController < ApplicationController
  def index
    @courses = Course.not_started.page(params[:page]).per(10)
  end
end
