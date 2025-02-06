class AddValidationsToDrafts < ActiveRecord::Migration[8.0]
  def change
    change_column_null :drafts, :purpose, false
    change_column_null :drafts, :recipient, false
    change_column_null :drafts, :sender, false
  end
end
