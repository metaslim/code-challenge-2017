require 'csv'
require_relative 'base_loader'

module CultureAmp
  module Loader
    class CSVLoader < CultureAmp::Loader::BaseLoader
      class << self

        private
        def parse(csv, options={})
          options = {
            header: false
          }.merge(options)

          yield(CSV.new(csv, {
            headers: options[:header],
            header_converters: :symbol,
            encoding: 'windows-1251:utf-8'
          })) if block_given?
        end
      end
    end
  end
end
