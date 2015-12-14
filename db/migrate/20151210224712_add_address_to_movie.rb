class AddAddressToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :address, :string
    add_column :movies, :city, :string
    add_column :movies, :country, :string
  end
end
