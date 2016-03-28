module RateRepository
  extend ActiveSupport::Concern

  included do
    scope :forced, -> { where(forced: true).order(:date_to) }
    scope :normal, -> { where(forced: false).order(:id) }
  end
end
