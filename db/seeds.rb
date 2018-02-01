Faker::Number.between(5, 10).times do
  Category.create!(name: Faker::Book.genre)
end

Category.each do |category|
  Faker::Number.between(20, 50).times do
    started = true
    start_date = Faker::Date.between(Date.today - 366, Date.today + 366)

    start_date >= Date.today ? started = false : started = true

    category.courses.create!(
      name: Faker::Educator.course,
      description: Faker::Lorem.paragraph,
      start_date: start_date,
      started: started
    )
  end
end
