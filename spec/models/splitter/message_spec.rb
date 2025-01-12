require 'rails_helper'

RSpec.describe Splitter::Message, type: :model do
  subject { FactoryBot.build(:splitter_message) }

  describe 'associations' do
    it "belongs to a message" do
      expect(subject.message).to be_a(Message)
    end
    # it { should belong_to(:message).class_name('Message') }
    it { should have_many(:parts).class_name('Splitter::MessagePart').dependent(:destroy) }
  end
end
