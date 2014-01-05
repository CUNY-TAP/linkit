require 'spec_helper'

describe "loging in/out" do
  before(:each) do
    @user = FactoryGirl.build(:user)
    @user.password = "password"
    @user.password_confirmation = "password"
    @user.save
  end

  it "logs a user in" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Welcome angie@angie.com"
  end

  
end