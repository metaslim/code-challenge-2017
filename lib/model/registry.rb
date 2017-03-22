class Registry
	@registry = {}

  class << self
    def create(id, *param)
      raise NotImplementedError
    end

    def get(id)
			@registry[id]
    end

    def registry
      @registry
    end

    def reset_registry
      @registry = {}
    end
  end

  def register
    self.class.registry[id] = self
  end

end