require 'spec_helper'

describe "loging in/out angie style" do
  before(:each) do
    @user = FactoryGirl.build(:user)
    @user.password = "notsecure"
    @user.password_confirmation = "notsecure"
    @user.save
  end

  it "logs a user in angie style" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Welcome test@test.com"
  end 
end

