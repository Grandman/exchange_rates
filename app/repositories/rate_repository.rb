module RateRepository
  extend ActiveSupport::Concern

  included do
    scope :forced, -> { where(forced: true).order(:id) }
  end
end