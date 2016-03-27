class DollarRateWorker
  include Sidekiq::Worker

  mattr_accessor(:parser) { RbcDollarRateParser }

  def perform
    rate = parser.perform
    return if rate.nil?
    Rate.create!(dollar_rate: rate)
  end
end

DollarRateWorker.perform_async
