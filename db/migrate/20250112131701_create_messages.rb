class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.text :text, null: false, default: "", limit: 16_000

      t.timestamps
    end

    # Add a check constraint to ensure text has at least one character
    add_check_constraint :messages, "char_length(text) > 0", name: "message_text_length_check"
  end
end
