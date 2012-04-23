class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name, :default => "", :null => false
      t.boolean :is_published, :default => false, :null => false

      t.timestamps
    end
  end
end
