class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @courses = @category.courses.not_started.order_by(created_at: :desc).page(params[:page]).per(10)
  end
end
