FactoryGirl.define do
  factory :rate do
    dollar_rate { generate :rate }
  end

  factory :forced_rate, parent: :rate do
    forced true
    date_to
  end
end
