require 'csv'
require_relative 'base_loader'

module CultureAmp
	module Loader
		class CSVLoader < CultureAmp::Loader::BaseLoader
		  class << self

		    private
		    def parse(csv)
		      yield(CSV.new(csv)) if block_given?
		    end
		  end
		end
	end
end