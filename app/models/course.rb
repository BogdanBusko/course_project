class Course
  include Mongoid::Document

  belongs_to :category

  field :name, type: String
  field :description, type: String
  field :start_date, type: Date
end
