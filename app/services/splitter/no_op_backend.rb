module Splitter
  class NoOpBackend
    def call(...)
      NullObject.new
    end
  end
end
