class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.references :survey
      t.references :user
      t.integer :last_page, :default => 0, :null => false
      t.text :answers, :default => "", :null => false
      t.boolean :is_complete, :default => false, :null => false

      t.timestamps
    end
  end
end
