require 'rails_helper'

RSpec.describe 'admin', type: :request do
  context 'index' do
    it 'render with 200 status' do
      get "/admin"
      expect(response).to be_success
    end
  end
end