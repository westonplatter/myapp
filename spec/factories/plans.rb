FactoryBot.define do
  factory :plan do
    user_id { 1 }
    version { 1 }
    title { "MyString" }
    data { "" }
  end
end
