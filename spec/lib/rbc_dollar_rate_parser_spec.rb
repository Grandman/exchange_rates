require 'rails_helper'

RSpec.describe RbcDollarRateParser do
  context 'get_core_search_geo_country_list' do
    let(:fixture_response) { File.read 'spec/fixtures/rbc.ru.html' }
    let!(:stub) { stub_request(:get, "http://www.rbc.ru").to_return(body: fixture_response) }
    let!(:rate) { RbcDollarRateParser.perform }

    it 'request api' do
      expect(stub).to have_been_requested
    end

    it 'return country list' do
      expect(rate).to eq('68,4346')
    end
  end
end