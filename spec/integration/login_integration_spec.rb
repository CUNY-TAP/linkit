require 'spec_helper'

describe "loging in/out" do
  before(:each) do
    @user = FactoryGirl.build(:user)
    @user.password = "notsecure"
    @user.password_confirmation = "notsecure"
    @user.save
  end

  it "logs a user in" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Welcome test@test.com"
  end

  it "requires a correct password" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => "totally wrong"

    click_button "Sign in"

    expect(page).to have_content "Invalid email or password."
    expect(page).to_not have_content "Welcome test@test.com"
  end

  it "logs out a user" do
    visit "/"

    click_link "Login"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    click_link "Logout"

    expect(page).to have_content "Signed out successfully"
  end  
end