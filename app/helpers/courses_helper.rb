module CoursesHelper
  def days_to_start(course)
    (course.start_date - Date.today).to_i
  end
end
