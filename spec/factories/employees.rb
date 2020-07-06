FactoryBot.define do
  factory :employee do
    google_user_id { "1234" }
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
  end
end
