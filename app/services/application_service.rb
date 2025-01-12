class ApplicationService

  class << self
    def call(...)
      new.call(...)
    end
  end

  def call
    raise NotImplementedError, "Implement this method in a child class"
  end

  delegate :logger, to: :Rails
end
