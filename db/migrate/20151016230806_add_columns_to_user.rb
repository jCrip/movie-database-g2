class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
  end
end
