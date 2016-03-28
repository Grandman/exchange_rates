require 'rails_helper'

RSpec.describe DollarRateWorker do
  before { WebMock.allow_net_connect! }
  context 'perform' do
    it 'create model' do
      expect{described_class.new.perform}.to change{Rate.count}.by(1)
    end
  end
end
