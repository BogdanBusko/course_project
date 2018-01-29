categories_count = Faker::Number.between(5, 10)

categories_count.times do
  Category.create!(name: Faker::Book.genre)
end

Category.each do |category|
  Faker::Number.between(20, 50).times do
    category.courses.create!(
      name: Faker::Educator.course,
      description: Faker::Lorem.paragraph,
      start_date: Faker::Date.between(Date.today, Date.today + 366)
    )
  end
end
