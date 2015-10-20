class AddUserRefToMovie < ActiveRecord::Migration
  def change
    add_reference :movies, :user, index: true, foreign_key: true
  end
end
