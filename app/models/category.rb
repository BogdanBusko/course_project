class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :courses

  validates :name, {
    presence: true,
    uniqueness: true,
    length: { minimum: 3, maximum: 50 }
  }

  field :name, type: String
end
