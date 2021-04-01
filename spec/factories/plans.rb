FactoryBot.define do
  factory :plan do
    part_id       {2}
    date          {2021-03-10}
    text          {"test"}
    user
  end
end
