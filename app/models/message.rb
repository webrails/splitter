class Message < ApplicationRecord

  MAX_CHAR_LENGTH = 16_000

  validates :text, presence: true, length: { minimum: 1, maximum: MAX_CHAR_LENGTH }

  after_create_commit { PublishMessageJob.perform_later(self) }

end
