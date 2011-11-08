class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :poll_id
      t.integer :user_id
      t.text :answer

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :poll_id
  end
end
