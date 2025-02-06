class Draft < ApplicationRecord
  TONES = [ "Professional", "Casual", "Friendly", "Persuasive", "Urgent", "Apologetic" ]
  READING_TIMES = [ "Short (~30s)", "Medium (~1 min)", "Long (~2+ min)" ]
  LANGUAGES = [ "EN", "FR", "ES", "DE", "IT", "PT", "NL" ]
end
