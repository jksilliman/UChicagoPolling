class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :page
      t.text :text, :default => "", :null => false
      t.text :hint, :default => "", :null => false
      t.string :type, :default => "", :null => false
      t.text :options, :default => "", :null => false

      t.timestamps
    end
  end
end
