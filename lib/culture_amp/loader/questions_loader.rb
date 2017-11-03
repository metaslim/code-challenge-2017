require_relative 'csv_loader'
require_relative '../model/question.rb'

module CultureAmp
  module Loader
    class QuestionsLoader < CultureAmp::Loader::CSVLoader
      class << self
        private
          def generate(csv)
            questions = []

            parse(csv, {header: true}) do |parsed_csv|
              parsed_csv.each_with_index do |row, index|
                questions << CultureAmp::Model::Question.create(
                  index,
                  row[:theme],
                  row[:type],
                  row[:text]
                )
              end
              questions
          end
        end
      end
    end
  end
end
