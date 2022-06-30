class User < ApplicationRecord
  rolify

  has_many :movies
  has_many :rating_for_movies, through: :movies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
