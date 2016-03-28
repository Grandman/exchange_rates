require 'rails_helper'

RSpec.describe 'main', type: :request do
  context 'index' do
    let(:forced_rate) { create :forced_rate, date_to: 5.day.from_now  }

    it 'render with 200 status' do
      get "/"
      expect(response).to be_success
    end

    it 'render with 200 status if exists forced rate' do
      forced_rate
      get "/"
      expect(response).to be_success
    end
  end
end