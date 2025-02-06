class CreateDrafts < ActiveRecord::Migration[8.0]
  def change
    create_table :drafts do |t|
      t.text :purpose
      t.string :recipient
      t.string :sender
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
