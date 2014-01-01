require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "making a new link without being signed in" do 
	visit '/'
	click_link "New"

	expect(page).to have_content "You need to sign in or sign up before continuing."
end

