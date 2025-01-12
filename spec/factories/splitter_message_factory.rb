FactoryBot.define do
  factory :splitter_message, class: 'Splitter::Message' do
    association :message, factory: :message
  end
end
