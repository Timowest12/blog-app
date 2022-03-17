require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    @user1 = User.create(name: 'fece', bio: 'r34dew', email: 'timowester@gmail.com')
  end

  it 'log in page contains sign in, Email fields and password button' do
    visit '/users/sign_in'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

  it 'wrong log in' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'nvalid Email or password'
  end

  it 'no password error' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'nvalid Email or password'
  end

  it 'correct log in data' do
    visit '/users/sign_up'
    within('body') do
      fill_in 'User Name', with: 'test'
      fill_in 'User Bio', with: 'bio'
      fill_in 'User Email', with: 'user@example.com'
      fill_in 'Enter Your Password (6 characters minimum)', with: '123456'
      fill_in 'Confirm Your Password', with: '123456'
    end

    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Sign in'
  end
end
