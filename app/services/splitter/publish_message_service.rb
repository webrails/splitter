module Splitter
  class PublishMessageService < ApplicationService

    WORD_SPLITTER = " "

    def call(message)
      splitter_message = Message.build(message: message)
      position         = 1
      text             = ""

      if message.text.length <= MessagePart::MAX_CHAR_LENGTH
        splitter_message.build_part(position: position, text: message.text)
        return splitter_message.save!
      end

      words = message.text.split(WORD_SPLITTER)

      words.each do |word|
        if word.size > MessagePart::MAX_CHAR_LENGTH
          raise ArgumentError, "Word '#{word}' is too long to be split"
        end

        extended_text = text.empty? ? word : [text, word].join(WORD_SPLITTER)

        if MessagePart.build_full_text(extended_text, position).size > MessagePart::MAX_CHAR_LENGTH
          splitter_message.build_part(position: position, text: MessagePart.build_full_text(text, position))
          position += 1
          text     = word
        else
          text = extended_text
        end
      end

      splitter_message.build_part(position: position, text: MessagePart.build_full_text(text, position))
      splitter_message.save!

      PublishMessageAdapter.call(splitter_message)
    end
  end
end
