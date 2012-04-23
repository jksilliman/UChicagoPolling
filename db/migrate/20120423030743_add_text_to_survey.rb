class AddTextToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :before_text, :text
    add_column :surveys, :after_text, :text
  end
end
