module FakeDollarRateParser
  extend self

  FAKE_RATE = 100.10

  def perform
    FAKE_RATE
  end
end
