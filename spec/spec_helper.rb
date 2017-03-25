require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.after(:each) do
  	# Reset Registry between test/assertion
  	CultureAmp::Model::Employee.reset_registry
  	CultureAmp::Model::Question.reset_registry
    # Reset sequence after each test, to ensure id mapping between Question and Answer matches
    FactoryGirl.reload
  end
end