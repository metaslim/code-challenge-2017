require 'json'

task :default => [:run]

desc "load the survey and the answer and execute it all!"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'application'

  # load the data files into strings for you
  responses_csv = File.read("example-data/survey-2-responses.csv")
  survey_csv = File.read("example-data/survey-2.csv")

  # call the app, passing the data as strings containing CSV
  result = Application.cli(responses_csv, survey_csv)

  # Print stuffs
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
	t.pattern = Dir.glob('spec/**/*_spec.rb')
	t.rspec_opts = '--format documentation --color'
end