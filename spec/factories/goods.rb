FactoryGirl.define do
  factory :good do
    title 'item'

    factory :good_with_days do
      after :create do |t|
        create_list :day, 3, good: t
      end
    end
  end
end
