module Splitter
  class Message < ApplicationRecord

    belongs_to :message, class_name: 'Message'

    has_many :parts, class_name: 'Splitter::MessagePart', foreign_key: 'message_id', dependent: :destroy, autosave: true

    def build_part(position:, text:)
      parts.build(message: self, position:, text:)
    end
  end
end
