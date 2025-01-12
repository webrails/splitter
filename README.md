# README

## Coding challenge: Message Splitter API

### Task overview

You are required to implement an API endpoint for sending short messages. Each message is limited to a maximum of 160
characters. If the input text exceeds this limit, it should be divided into multiple messages. Each part must end
with "- part n" where "n" is the respective part number.

### Requirements

1. Each message part, including the suffix "- part n," must never exceed 160 characters.
2. The suffix should start from "- part 1" and increment for each subsequent part.
3. The splitting should avoid breaking words where possible. If a word does not fit into the remaining space of a
   message part, it should be moved to the next part. Try to keep the message amount to a minimum.
4. Sent messages should be stored in a postgres database table.

### Instructions

- Create a Rails application with the needed structure.
- Implement the endpoint and all needed components.
- Approach this challenge as you would for a professional/production-level application.
- Submit the (GitHub) repository link after finishing the challenge.

### Constraints

- Your implementation should handle input message lengths of up to 16k chars.
- Aim to make the implementation as efficient and clean as possible.
- Sending out actual messages is NOT in scope here, just create a fake service that accepts the payload per message but
  does not do anything else.

### Notes

- Solving the task should not take more than 3 hours max. If you reach this limit, please note down the next/missing
  steps for later discussion.
- Please manage your time and focus on the most important parts first.
- Optional: Document known issues/shortcomings and missing parts of your implementation and ideas on how to tackle them.

## Implementation notes / issues / shortcomings

- I assume that the concept of a message is an independant concept not only related to a specific short message API. It
  is yet unclear whether the validation of the input message length of up to 16k chars is a requirement for the API
  only or the message itself. I assume it applies to all messages.
- I try to separate all things related to the external API (called `Splitter`) from the core message logic, so that the
  core message concept doesn't know too much about external APIs.
- In a real API client unsuccessful responses (e.g. "rate limits exceeded") and exceptions should be handled properly.
- Currently, splitter messages and splitter message parts are persisted before pushing them to the external API. I
  assume this might be helpful in case of failures when calling the API. If extended with a status field, it could be
  used to track the sending status of the message and retry later.
- Splitting texts into words solely by an empty space might not be sufficient for all languages. In a real-world
  application, a more sophisticated word splitter should be elaborated including more specs.
- Addressing punctuation errors is currently out of scope for this implementation.
- The current implementation does not handle the case where a single word is longer than 160 characters (including
  suffix). In a real-world application, this should be addressed.
- The application can be started via `docker compose up -d --build web`.
