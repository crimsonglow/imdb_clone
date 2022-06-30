require 'rails_helper'

RSpec.describe Movie, type: :model do

  context 'associations' do
    it { should belong_to(:users) }
    it { should have_many(:rating_for_movies) }
  end
end
