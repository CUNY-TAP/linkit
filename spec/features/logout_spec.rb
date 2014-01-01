require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "logging out" do
	user = FactoryGirl.create(:user)
	visit '/'
	click_link 'Login'
	fill_in 'user[Email]', :with => user.email
	fill_in 'user[Password]', :with => user.password 
	click_button "Sign In"

	click_link "logout"
	expect(page).to have_content "Signed out successfully."
end