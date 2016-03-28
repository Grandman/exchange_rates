require 'rails_helper'

RSpec.describe 'admin', type: :request do
  let!(:forced_rate) { create :forced_rate }
  let(:forced_rate_attributes) { attributes_for :forced_rate}
  before{ WebMock.allow_net_connect! }

  context 'index' do
    it 'render with 200 status' do
      get '/admin'
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'create model' do
      post '/admin', forced_rate_form: forced_rate_attributes
      expect(Rate.forced).to be_exists(dollar_rate: forced_rate_attributes[:dollar_rate])
      expect(response).to be_redirect
    end
  end
end