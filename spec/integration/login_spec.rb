require 'spec_helper'

def login
  User.create(email:'linda@linda.com',password:'lindalinda')
  visit '/users/sign_in'
  fill_in 'user[email]', with: 'linda@linda.com'
  fill_in 'user[password]', with: 'lindalinda'
  click_button 'Sign in'
end

def create_link
  visit '/links/new'
  fill_in 'link[url]', with: 'google.com'
  fill_in 'link[name]', with: 'Google'
  click_button 'Create Link'
end

def create_comment
  fill_in 'comment[comment]', with: 'Lorem ipsum'
  click_button 'Submit'
end


describe 'signing in and signing out tests' do
  
  before :each do
    login
  end
  
  it 'signs in correctly' do
    expect(page).to have_content 'Signed in successfully.'
  end
  
  it 'signs out' do
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end

end

describe 'link tests' do
  
  it 'creates a link' do
    login
    create_link
    expect(page).to have_content 'Link was successfully created.'
  end

  it 'creates a link without logging in' do
    visit '/links/new'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end

describe 'comment tests' do
  
  before :each do
    login
    create_link
    create_comment
  end
  
  it 'creates a comment' do
    login
    create_link
    create_comment
    expect(page).to have_content 'Lorem ipsum'
  end

end

describe 'up or downvotes a comment' do

  it 'updates cumulative score' do
    login
    create_link
    create_comment
    click_link 'Vote up'
    find('dl').should have_content '1'
    click_link 'Vote down'
    find('dl').should have_content '0'
  end  

end