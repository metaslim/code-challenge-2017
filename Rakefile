require 'json'

task :default => [:run]

desc "load the survey and the answer and execute it all!"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'application'

  # load the data files into strings for you
  responses_csv = File.read("example-data/survey-1-responses.csv")
  survey_csv = File.read("example-data/survey-1.csv")

  # call the app, passing the data as strings containing CSV
  result = Application.cli(responses_csv, survey_csv)

  # Print stuffs
end

require 'rake/testtask'