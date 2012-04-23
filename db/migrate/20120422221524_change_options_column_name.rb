class ChangeOptionsColumnName < ActiveRecord::Migration
  def up
    remove_column :questions, :options
    add_column :questions, :options_data, :text
  end

  def down
  end
end
