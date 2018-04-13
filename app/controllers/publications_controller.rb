class PublicationsController < ApplicationController
  def index
    @courses = Course.where(user_id: current_user.id).order_by(created_at: :desc).page(params[:page]).per(10)
  end
end
