require 'rails_helper'

RSpec.describe Splitter::PublishMessageService, type: :model do
  let(:message) { FactoryBot.create(:message, text: text) }

  subject { described_class.new }

  describe '#call' do
    context "when message text fits in one part" do
      let(:text) { "Lorem ipsum dolor sit amet  consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, is nostrud." }

      it "creates a splitter message with one part with the whole message omitting suffix" do
        expect do
          expect do
            subject.call(message)
          end.to change { Splitter::Message.count }.by(1)
        end.to change { Splitter::MessagePart.count }.by(1)

        message_part = Splitter::MessagePart.last
        expect(message_part.text).to eq(text)
      end
    end

    context "when message text does not fits in one part" do
      let(:text) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud." }

      it "creates a splitter message with separate parts with suffix" do
        expect do
          expect do
            subject.call(message)
          end.to change { Splitter::Message.count }.by(1)
        end.to change { Splitter::MessagePart.count }.by(2)

        splitter_message_parts = Splitter::MessagePart.sorted

        first_part = splitter_message_parts.first
        expect(first_part.text).to eq("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, - part 1")

        last_part = splitter_message_parts.last
        expect(last_part.text).to eq("quis nostrud. - part 2")
      end
    end
  end
end
