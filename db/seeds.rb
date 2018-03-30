Faker::Number.between(5, 10).times do
  category = Faker::Book.genre
  while Category.where(name: category).count == 0 do
    Category.create!(name: category)
  end
end

Category.each do |category|
  Faker::Number.between(20, 40).times do
    started = true
    start_date = Faker::Date.between(Date.today - 366, Date.today + 366)

    start_date >= Date.today ? started = false : started = true

    category.courses.create!(
      name: Faker::Educator.course,
      description: Faker::Lorem.paragraph,
      start_date: start_date,
      started: started,
      confirmed: Faker::Boolean.boolean(0.5)
    )
  end
end

Course.each do |course|
  Faker::Number.between(1, 4).times do
    contact = course.contacts.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email
    )

    contact.facebook = "https://www.facebook.com/#{Faker::Internet.user_name}" if Faker::Boolean.boolean(0.5)
    contact.skype = Faker::Internet.user_name if Faker::Boolean.boolean(0.5)

    contact.save!
  end

  Faker::Number.between(1, 3).times do
    course.teachers.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      age: Faker::Number.between(25, 40),
      information: Faker::Lorem.paragraph
    )
  end
end
