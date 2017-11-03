module CultureAmp
  module Loader
    class BaseLoader
      class << self

        def load_from(file_stream)
          generate(file_stream)
        end

        private
        def generate(file_stream)
          raise NotImplementedError
        end

        def parse(data)
          raise NotImplementedError
        end

      end
    end
  end
end
