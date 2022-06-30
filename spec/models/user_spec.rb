require 'rails_helper'

RSpec.describe User, type: :model do

  context 'associations' do
    it { should have_many(:movies) }
    it { should have_many(:rating_for_movies).through(:movies) }
  end
end
