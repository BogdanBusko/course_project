class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @courses = @category.courses.not_started.page(params[:page]).per(10)
  end
end
