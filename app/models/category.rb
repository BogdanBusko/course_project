class Category
  include Mongoid::Document

  has_many :courses

  field :name, type: String

  validates :name, {
    presence: true,
    uniqueness: true,
    length: { minimum: 3, maximum: 50 }
  }
end
