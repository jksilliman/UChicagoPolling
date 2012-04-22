class AddBasicInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :needs_info, :boolean, :default => true, :null => false
    add_column :users, :division, :string
    add_column :users, :year, :string
    add_column :users, :location, :string
  end
end
