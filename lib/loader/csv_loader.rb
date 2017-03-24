require 'csv'
require_relative 'base_loader'

class CSVLoader < BaseLoader
  class << self

    private
    def parse(csv)
      yield(CSV.new(csv)) if block_given?
    end

  end
end
