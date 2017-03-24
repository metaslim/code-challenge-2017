require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end


  config.after(:each) do
  	# Reset sequence after each test, to ensure id mapping between Question and Answer matches
    FactoryGirl.reload
  end
end