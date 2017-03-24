require 'optparse'
require 'rake/testtask'
require 'rspec/core/rake_task'

task :default => [:run]

desc "load the survey and the answer and execute it all!"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'application'

  ARGV.shift
  ARGV.shift

  ARGV << '-h' if ARGV.empty?

	options = {}
	survey_file = 'example-data/survey-2.csv'
  response_file = 'example-data/survey-2-responses.csv'

	# parse param for rake
	opt_parser = OptionParser.new do |opt|
		opt.banner = "Usage: \n\n To run test : rake spec \n\n To run the app : rake run -- [options] \n\n For eg. rake run -- -s=#{survey_file} -r=#{response_file}"
		opt.on("-s CSV FILE", "--survey_file CSV FILE") do |csv_file| 
			csv_file.gsub! /\=/,''
			options[:survey_file] = csv_file 
		end

  	opt.on("-r CSV FILE", "--response_file CSV FILE") do |csv_file|
  		csv_file.gsub! /\=/,''
  		options[:response_file] = csv_file 
  	end

	  opt.on_tail("-h", "--help", "help") do
	   	puts opt_parser
	    exit
	  end
	end

  opt_parser.parse!

  # load the data files into strings for you
  responses_csv = File.read(options[:response_file].to_s)
  survey_csv = File.read(options[:survey_file].to_s)

  # call the app, passing the data as strings containing CSV
  Application.cli(responses_csv, survey_csv)
end



RSpec::Core::RakeTask.new(:spec) do |t|
	t.pattern = Dir.glob('spec/**/*_spec.rb')
	t.rspec_opts = '--format documentation --color'
end

desc "Run Tests"
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'

  test.test_files = FileList['test/**/*_test.rb']
end