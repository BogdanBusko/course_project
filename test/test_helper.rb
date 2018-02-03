require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  DatabaseCleaner.clean_with :truncation
end
