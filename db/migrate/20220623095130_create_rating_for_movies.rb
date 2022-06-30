class CreateRatingForMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :rating_for_movies do |t|
      t.belongs_to :movie, index: true, foreign_key: true
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
