require_relative 'csv_loader'
require_relative '../model/employee.rb'
require_relative '../model/response.rb'

module CultureAmp
  module Loader
    class ResponsesLoader < CultureAmp::Loader::CSVLoader

      class << self
        private

         def generate(csv)
           responses = []

          parse(csv) do |parsed_csv|
            parsed_csv.each do |row|
              (email, id, timestamp) = row[0..2]
              answers = row[3..-1]

              responses << CultureAmp::Model::Response.new(
                CultureAmp::Model::Employee.create(id, email),
                answers,
                timestamp
              )
            end
          end

          responses
        end
      end
    end
  end
end
