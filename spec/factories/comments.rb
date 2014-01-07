# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
  	commenter "Angie"
    body "Woot! This is an excellent comment!"
    score 1
    # link "www.google.com"
    # t.references :link, index: true
  end
end