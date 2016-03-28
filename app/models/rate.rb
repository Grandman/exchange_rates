class Rate < ActiveRecord::Base
  include RateRepository

  validates :dollar_rate, presence: true
end