require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "making a new link without being signed in" do 
	visit '/'
	click_link "New"

	expect(page).to have_content "You need to sign in or sign up before continuing."
end

describe "Making a Link After Logging In"
user = FactoryGirl.create(:user)
	visit '/'
	click_link 'Login'
	fill_in 'user[Email]', :with => user.email
	fill_in 'user[Password]', :with => user.password 
	click_button "Sign In"
	click_link "New"

	fill_in 'Url', :with => "reddit.com"
    fill_in 'Name', :with => "reddit"
    click_button 'Create Link'
    expect(page).to have_content "Link was successfully created"

end