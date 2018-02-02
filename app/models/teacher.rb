class Teacher
  include Mongoid::Document

  embedded_in :course

  field :first_name, type: String
  field :last_name, type: String
  field :age, type: Integer
  field :information, type: String
end
