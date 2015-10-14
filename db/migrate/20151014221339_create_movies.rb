class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.date :realease_date
      t.string :studio

      t.timestamps null: false
    end
  end
end
