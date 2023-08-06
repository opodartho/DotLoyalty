FactoryBot.define do
  factory :condition do
    condition_type { 1 }
    condition_cmp { 1 }
    value { "MyString" }
    rule { nil }
    store { nil }
  end
end
