class AiService
  attr_reader :client

  def initialize
    @client = generate_client
  end

  def generate_cold_email(draft)
    messages = [
      {
        role: "system",
        content: <<-STR.squish
          You are a cold email generator.
          Your mission is to generate beautiful cold emails.
          for given purpose, recipient and sender.
          You have to give me an answer in a form of a JSON object,
          containing subject and body keys.
        STR
      },
      {
        role: "user",
        content: <<-STR
          Purpose : #{draft.purpose}
          Recipient : #{draft.recipient}
          Sender : #{draft.sender}
        STR
      }
    ]

    response = chat(messages)
    json_str = response.dig("choices", 0, "message", "content")
    JSON.parse(json_str).with_indifferent_access
  end

  private

  def generate_client
    OpenAI::Client.new(access_token: ENV["OPEN_AI_KEY"], log_errors: true)
  end

  def chat(messages, temperature: 0.7, response_format: { type: "json_object" })
    @client.chat(
      parameters: {
        model: "gpt-4o",
        response_format:,
        messages:,
        temperature:
      }
    )
  end
end
