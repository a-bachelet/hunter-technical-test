class AddToneReadingTimeLanguageToDrafts < ActiveRecord::Migration[8.0]
  def change
    add_column :drafts, :tone, :string
    add_column :drafts, :reading_time, :string
    add_column :drafts, :language, :string
  end
end
