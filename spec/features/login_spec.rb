require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "seeing the homepage", type: :feature do
	include Capybara::DSL
	visit '/'
	expect(page).to have_content 'Login'
end

describe "going to the sign in page" do
	visit '/'
	click_link 'Login'
	expect(page).to have_content 'Sign In'
end

describe "filling in and clicking sign in" do
	user = FactoryGirl.create(:user)
	visit '/'
	click_link 'Login'
	fill_in 'user[Email]', :with => user.email
	fill_in 'user[Password]', :with => user.password 
	click_button "Sign In"
	expect(page).to have_content "Welcome test@test.com"
end

describe "attempt to login with wrong password" do
	user = FactoryGirl.create(:user)
	visit '/'
	click_link 'Login'
	fill_in 'user[Email]', :with => user.email
	fill_in 'user[Password]', :with => "wrongpassword"
	click_button "Sign In"
	expect(page).to have_content "Invalid email or password"
end


