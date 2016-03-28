class ForcedRateForm < BaseForm

  attribute :dollar_rate, Float, default: ->(*) { last_forced&.dollar_rate || 0.0 }
  attribute :date_to, DateTime, default: ->(*) { last_forced&.date_to || DateTime.current }

  validates :dollar_rate, presence: true, numericality: { greater_than: 0 }
  validates :date_to, presence: true, timeliness: { after: ->(*) { DateTime.current }, type: :datetime }

  def self.last_forced
    Rate.forced.last
  end
end
