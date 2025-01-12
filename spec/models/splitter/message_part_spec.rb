require 'rails_helper'

RSpec.describe Splitter::MessagePart, type: :model do

  subject { FactoryBot.build(:splitter_message_part) }

  describe 'validations' do
    it 'is valid with a text between 1 and 160 characters' do
      expect(subject).to be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a text shorter than 1 character' do
      subject.text = ""
      expect(subject).not_to be_valid
    end

    it 'is not valid with a text longer than 160 characters' do
      subject.text = "a" * 161
      expect(subject).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:message).class_name('Splitter::Message') }
  end
end
