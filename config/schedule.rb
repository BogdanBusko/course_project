set :chronic_options, hours24: true

every :day, at: '3:00' do
  runner 'Course.change_status'
end
