require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "Upvoting a link"
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

    click_link 'up-vote'
    visit(current_path)
    expect(page).to have_content "1"
end

describe "Downvoting a link"
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

    click_link 'down-vote'
    visit(current_path)
    expect(page).to have_content "-1"
end