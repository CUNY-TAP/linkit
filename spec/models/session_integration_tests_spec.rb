require 'spec_helper'

describe "user session" do
  before(:each) do
    @user = FactoryGirl.build(:user)
    @user.password = "password"
    @user.password_confirmation = "password"
    @user.save

    @link = FactoryGirl.build(:link)
  end

  it "logs a user in" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Welcome angie@angie.com"
    expect(page).to have_content "New"
  end

  it "logs a user in and then signs out" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    click_link "Logout"

    expect(page).to have_content "Signed out successfully."

    expect(page).to have_no_content "New"
  end

  it "logs in and creates a link" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    click_link "New"

    fill_in 'Url', with: 'www.apple.com'
    fill_in 'Name', with: 'Angie'

    click_button "Create Link"

    expect(page).to have_content "Link was successfully created."

  end

  it "logs in and creates a link and a comment for that link" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    click_link "New"

    fill_in 'Url', with: 'www.apple.com'
    fill_in 'Name', with: 'Apple'

    click_button "Create Link"

    expect(page).to have_content "Link was successfully created."

    click_button "Comment"
  
    fill_in 'Commenter', with: 'Angie'
    fill_in 'Body', with: 'This is a test comment!'

    click_button "Create Comment"

    expect(page).to have_content "Commenter: Angie"
    expect(page).to have_content "Comment: This is a test comment!"

  end

end