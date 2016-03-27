FactoryGirl.define do
  sequence(:rate) { |n| 10.0 + n + n / 10 }
  sequence(:date_to) { |n| DateTime.now + n.hours }
end
