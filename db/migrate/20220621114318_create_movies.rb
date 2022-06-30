class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :average_rating
      t.string :category

      t.timestamps
    end
  end
end
