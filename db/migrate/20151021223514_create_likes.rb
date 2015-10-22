class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :likeable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
