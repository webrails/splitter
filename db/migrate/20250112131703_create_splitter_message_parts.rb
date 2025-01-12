class CreateSplitterMessageParts < ActiveRecord::Migration[8.0]
  def change
    create_table :splitter_message_parts do |t|
      t.references :message, null: false, foreign_key: { to_table: 'splitter_messages' }
      t.integer :position, null: false
      t.text :text, null: false, default: "", limit: 160

      t.timestamps
    end

    add_check_constraint :splitter_message_parts, "char_length(text) > 0", name: "splitter_message_part_text_length_check"
    add_check_constraint :splitter_message_parts, "position > 0", name: "splitter_message_part_position_check"
  end
end
