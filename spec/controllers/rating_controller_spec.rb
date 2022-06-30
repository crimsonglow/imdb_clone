require 'rails_helper'

RSpec.describe RatingController, type: :controller do
  describe "POST rating#create" do
    let(:user) {FactoryBot.create(:user)}
    let(:movie) {FactoryBot.create(:movie, user_id: user.id)}

    it "should save the new rating for movie in the database" do
      sign_in(user)
      rating_params = {id: movie, rating: 2}

      post(:create, params: rating_params)

      expect(response).to redirect_to(movies_path)
    end
  end
  describe "PATCH rating for movie" do
    let(:user) {FactoryBot.create(:user)}
    let(:movie) {FactoryBot.create(:movie, user_id: user.id)}

    before :each do
      @rating = movie.rating_for_movies.create(user_id: user.id, rating: 10)
    end

    it "should updates the requested rating for movie" do
      sign_in(user)
      rating_params = {id: movie, rating: 1}

      patch(:update, params: rating_params)

      expect(response).to render_template('movies/index')
    end
  end
end
