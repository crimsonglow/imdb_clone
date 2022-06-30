require 'rails_helper'

RSpec.describe RatingForMovie, type: :model do

  context 'associations' do
    it { should belong_to(:movies) }
  end
end
