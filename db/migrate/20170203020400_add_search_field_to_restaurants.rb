class AddSearchFieldToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :search, :string
  end
end
