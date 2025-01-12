class PublishMessageJob < ApplicationJob

  queue_as :default

  def perform(message)
    PublishMessageService.call(message)
  end
end
