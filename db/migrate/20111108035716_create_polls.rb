class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :question
      t.text :answers_data

      t.timestamps
    end
  end
end
