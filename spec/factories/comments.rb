# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment, :class => 'Comment' do
  	text "Your post sucks!"
  	score 0
  end
end
