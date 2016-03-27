class ForcedRateForm < BaseForm
  attribute :dollar_rate, Float, default: ->(*) { 0.0 }
  attribute :date_to, DateTime, default: ->(*) { DateTime.current }

  validates :dollar_rate, presence: true, numericality: { greater_than: 0 }
  validates :date_to, presence: true
end