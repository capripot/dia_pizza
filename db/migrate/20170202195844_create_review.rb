class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.integer :rating
      t.text :content
      t.timestamps
    end
  end
end
