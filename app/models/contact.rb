class Contact
  include Mongoid::Document

  embedded_in :course

  validates :first_name, :last_name, :phone, :email, presence: true

  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :facebook, type: String
  field :email, type: String
  field :skype, type: String
end
