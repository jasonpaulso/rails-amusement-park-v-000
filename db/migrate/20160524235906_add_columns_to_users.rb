class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nausea, :integer
    add_column :users, :happiness, :integer
    add_column :users, :tickets, :integer
    add_column :users, :height, :integer
  end
end
