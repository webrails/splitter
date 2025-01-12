class PublishMessageService < ApplicationService
  class << self
    attr_writer :backend

    delegate :call, to: :backend

    def backend = @backend ||= Splitter::PublishMessageService.new
  end
end
