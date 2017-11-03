require_relative 'culture_amp/loader/loader_pack'
require_relative 'culture_amp/presenter/presenter_pack'
require_relative 'culture_amp/report/base_report'
require 'optparse'

class Application
  def cli
    (responses_csv, survey_csv) = parse_cli_arguments
    run(responses_csv, survey_csv)
  end

  private
  def parse_cli_arguments
    ARGV << '-h' if ARGV.empty?

    options = {}
    survey_file = 'example-data/survey-2.csv'
    response_file = 'example-data/survey-2-responses.csv'

    # parse param for rake
    opt_parser = OptionParser.new do |opt|
      opt.banner = "Usage: \n\n survey-tool [options] \n\n For eg. survey-tool -s=#{survey_file} -r=#{response_file}"
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
    return options[:response_file], options[:survey_file]
  end

  def run(response_csv, survey_csv)
    # load the data files into strings for you
    questions = CultureAmp::Loader::QuestionsLoader.load_from(File.read(survey_csv))
    responses = CultureAmp::Loader::ResponsesLoader.load_from(File.read(response_csv))

    report = CultureAmp::Report::BaseReport.new(questions, responses)

    report
    .add_presenter(CultureAmp::Presenter::ParticipationPercentage.new)
    .add_presenter(CultureAmp::Presenter::TotalParticipant.new)
    .add_presenter(CultureAmp::Presenter::RatingAverage.new)
    .add_presenter(CultureAmp::Presenter::SingleSelection.new)

    puts report.build
  end
end
