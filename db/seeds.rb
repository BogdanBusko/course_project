category_count = Faker::Number.between(5, 10)

category_count.times do
  Category.create!(name: "#{Faker::Educator.course}#{Faker::Number.number(3)}")
end
