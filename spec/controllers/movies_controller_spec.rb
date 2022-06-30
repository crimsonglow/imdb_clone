require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET movies#index" do
    let(:user) {FactoryBot.create(:user)}
    let(:movies) {FactoryBot.create_list(:movie, 5, user_id: user.id)}

    it "loads all of the movies" do
      get(:index)
      expect(assigns(:movies)).not_to eq(nil)
    end

    it "returns a successful response" do
      get(:index)

      movies.each do |movie|
        expect(movie.title).not_to eq(nil)
        expect(movie.category).not_to eq(nil)
        expect(movie.description).not_to eq(nil)
        expect(movie.id).not_to eq(nil)
      end
    end

    it "renders the index template" do
      get(:index)
      expect(response).to render_template("index")
    end

      it "has a 200 status code" do
        get(:index)
        expect(response.status).to eq(200)
    end
  end

  describe "GET movies#new" do

   it "should render new" do
      sign_in(FactoryBot.create(:admin))

      get(:new)

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET movies#edit" do
    let(:user) {FactoryBot.create(:admin)}
    let(:movie) {FactoryBot.create(:movie, user_id: user.id)}

      it "should render edit" do
      sign_in(user)

      get(:edit, params: {id: movie})

      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST movies#create" do

    it "should save the new movie in the database" do
      movie_params = {movie: {title: 'Riddick:', category: 'action', description: 'Left for dead on a sun-scorched planet'}}
      sign_in(FactoryBot.create(:admin))

      post(:create, params: movie_params)

      expect(response).to redirect_to(movies_path)
    end

      it "with invalid description" do
        movie_params = {movie: {title: 'Riddick:', category: 'action', description: ''}}
        sign_in(FactoryBot.create(:admin))

        post(:create, params: movie_params)

        expect(response).to render_template(:new)
        expect(response.body).to eq('')
        expect(response).to have_http_status(:ok)
     end
  end

  describe "PATCH movies" do
    let(:user) {FactoryBot.create(:admin)}
    let(:movie) {FactoryBot.create(:movie, user_id: user.id)}

    it "should updates the requested movie" do
      sign_in(user)
      movie_params = {id: movie, movie: {title: 'right value:', category: 'right value', description: 'right value'}}

      patch(:update, params: movie_params)

      movie do |movie|
        expect(movie.title).not_to eq('right value:')
        expect(movie.category).not_to eq('right value:')
        expect(movie.description).not_to eq('right value:')
      end
      expect(response).to redirect_to(movies_path)
    end

    it "with invalid description" do
      sign_in(user)
      movie_params = {id: movie, movie: {title: 'right value:', category: 'right value', description: ''}}

      patch(:update, params: movie_params)

      expect(response).to render_template(:edit)
      expect(response.body).to eq('')
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE movies" do
    let(:user) {FactoryBot.create(:admin)}
    let(:movie) {FactoryBot.create(:movie, user_id: user.id)}

    it "should deletes the movie" do
      sign_in(user)
      delete(:destroy, params: {id: movie})
      expect(response).to redirect_to(movies_path)
    end
  end
end
