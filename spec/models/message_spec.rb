require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { FactoryBot.build(:message) }

  describe 'validations' do
    it 'is valid with a text between 1 and 16000 characters' do
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

    it 'is not valid with a text longer than 16000 characters' do
      subject.text = "a" * 16001
      expect(subject).not_to be_valid
    end
  end

  describe 'callbacks' do
    it 'enqueues PublishMessageJob after create' do
      expect {
        subject.save!
      }.to have_enqueued_job(PublishMessageJob).with(subject)
    end
  end
end
