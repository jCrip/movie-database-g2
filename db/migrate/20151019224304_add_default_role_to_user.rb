class AddDefaultRoleToUser < ActiveRecord::Migration
  def up
    change_column :users, :role, :integer, default: 2, null: false
  end

  def down
    change_column :users, :role, :integer, default: nil
  end
end
