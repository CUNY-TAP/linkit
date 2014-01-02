require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

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

    fill_in 'comment[body]', :with => "TestingCommentUnique"
    click_button 'Create Comment'
	expect(page).to have_content "TestingCommentUnique"
end 

