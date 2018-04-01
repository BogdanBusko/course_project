set :chronic_options, hours24: true

every :day, at: '3:00' do
  # Delete unconfirmed user after 7 days
  runner 'User.delete_unconfirmed_user'
end
