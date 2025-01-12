module Splitter
  class MessagePart < ApplicationRecord

    belongs_to :message, class_name: 'Splitter::Message', foreign_key: 'message_id'

    MAX_CHAR_LENGTH = 160

    validates :position, presence: true, numericality: { only_integer: true, greater_than: 0 }

    validates :text, presence: true, length: { minimum: 1, maximum: MAX_CHAR_LENGTH }, if: :position

    scope :sorted, -> { order(position: :asc) }

    class << self
      def build_full_text(text, position)
        "#{text} - part #{position}"
      end
    end
  end
end
