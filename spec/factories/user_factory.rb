FactoryBot.define do
  factory :user do
    email { 'test@email.com' }
    password { 'password1' }
    jti { '5841df76-1e60-4897-8ed5-b0fe59dd4c73' }
  end
end
