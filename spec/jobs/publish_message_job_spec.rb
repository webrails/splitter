require 'rails_helper'

RSpec.describe PublishMessageJob, type: :job do
  let(:message) { FactoryBot.create(:message) }

  describe '#perform' do
    it 'calls the PublishMessageService with the message' do
      expect(PublishMessageService).to receive(:call).with(message)
      described_class.perform_now(message)
    end
  end
end
