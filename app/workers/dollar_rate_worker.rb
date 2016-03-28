class DollarRateWorker
  include Sidekiq::Worker

  mattr_accessor(:parser) { RbcDollarRateParser }

  def perform
    rate = parser.perform
    return if rate.nil?
    Rate.create!(dollar_rate: rate)
    last_forced = Rate.forced.last
    return if last_forced.present? && last_forced.date_to > DateTime.current
    PublishService.perform(rate)
  end
end

DollarRateWorker.perform_async
