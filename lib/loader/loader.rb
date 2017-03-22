require 'csv'

class Loader
  class << self

    def load_from(csv)
      generate(csv)
    end

    private

    def generate(csv)
      raise NotImplementedError
    end

    def parse(csv)
      yield(CSV.new(csv)) if block_given?
    end

  end
end
