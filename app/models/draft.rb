class Draft < ApplicationRecord
  TONES = [ "Professional", "Casual", "Friendly", "Persuasive", "Urgent", "Apologetic" ]
  READING_TIMES = [ "Short (~30s)", "Medium (~1 min)", "Long (~2+ min)" ]
  LANGUAGES = [ "EN", "FR", "ES", "DE", "IT", "PT", "NL" ]
  EMOJIS = [
    "🔥 Exciting",
    "😊 Friendly",
    "💼 Professional",
    "🔔 Urgent"
  ]

  validates :purpose, presence: true, length: { minimum: 5, maximum: 500 }
  validates :recipient, presence: true
  validates :sender, presence: true
  validates :tone, inclusion: { in: TONES, message: "%{value} is not a valid tone", allow_nil: true }
  validates :reading_time, inclusion: { in: READING_TIMES, message: "%{value} is not a valid reading time", allow_nil: true }
  validates :language, inclusion: { in: LANGUAGES, message: "%{value} is not a valid language", allow_nil: true }
  validates :emojis, inclusion: { in: EMOJIS, message: "%{value} is not a valid emojis category", allow_nil: true }
end
