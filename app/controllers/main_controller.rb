class MainController < ApplicationController
  def index
    @categories = Category.all
    @courses = Course.all
  end
end
