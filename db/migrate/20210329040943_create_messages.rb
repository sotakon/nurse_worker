class CreateMessages < ActiveRecord::Migration[5.2]
  create_table :messages do |t|
    t.text :body
    t.references :conversation, foreign_key: true
    t.references :user, foreign_key: true
    t.boolean :read, default: false
    t.timestamps
  end
end