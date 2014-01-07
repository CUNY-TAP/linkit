# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
          email "angie@angie.com"
          password "password"
  end

  # factory :user_with_link, parent: :user do
  # 	after(:create) do |user|
  # 	  FactoryGirl.create(:link, user:user)
  # 	end
  # end
end