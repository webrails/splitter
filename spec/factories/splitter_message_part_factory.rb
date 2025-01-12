FactoryBot.define do
  factory :splitter_message_part, class: 'Splitter::MessagePart' do
    association :message, factory: :splitter_message
    sequence(:position) { |n| n }
    text { "Lorem ipsum" }
  end
end
