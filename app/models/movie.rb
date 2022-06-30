class Movie < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  has_many :rating_for_movies, dependent: :destroy

  validates :user_id, :title, :description, :category, presence: true
  validates :description, length: {minimum: 5}
end
