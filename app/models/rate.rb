class Rate < ActiveRecord::Base
  validates :dollar_rate, presence: true
end