class Contact
  include Mongoid::Document

  embedded_in :course

  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :facebook, type: String
  field :email, type: String
  field :skype, type: String
end
