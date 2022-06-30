class RatingForMovie < ApplicationRecord
  belongs_to :movies, foreign_key: 'movie_id', class_name: 'Movie'

  validates :movie_id, uniqueness: {scope: :user_id}
  validates :movie_id, :user_id, :rating, presence: true

  rating_amount = (1..10).to_a

  validates :rating, inclusion: {
    in: rating_amount,
    message: "must be between 1 and 10"
  }
end
