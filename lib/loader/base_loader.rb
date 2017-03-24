class BaseLoader
  class << self

    def load_from(csv)
      generate(csv)
    end

    private
    def generate(csv)
      raise NotImplementedError
    end

    def parse(csv)
      raise NotImplementedError
    end

  end
end
