class CreateSplitterMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :splitter_messages do |t|
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
