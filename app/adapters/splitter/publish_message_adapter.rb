module Splitter
  class PublishMessageAdapter
    class << self
      def call(message)
        message.parts.sorted.all? do |_part|
          # TODO: Implement the API adapter to publish the message part, handle exceptions
          true
        end
      end
    end
  end
end
