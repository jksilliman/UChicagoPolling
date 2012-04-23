class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :survey
      t.string :title
      t.text :description
      t.integer :order

      t.timestamps
    end
  end
end
