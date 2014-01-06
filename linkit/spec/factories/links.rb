# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
          url "www.google.com"
          name "Google"
          score 0
  end

  factory :link_with_comment, parent: :link do
          after(:create) do |link|
            FactoryGirl.create(:comment, link:link)
          end
  end

end