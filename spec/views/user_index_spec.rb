require 'rails_helper'

describe 'user index page tests', type: :feature do
  before :each do
    @user1 = User.create(name: 'testname', bio: 'testbio', email: 'user@example.com', password: '123456', id: 1, confirmed_at: Time.now)
    @user2 = User.create(name: 'testname2', bio: 'testbio2', email: 'user2@example.com', password: '123456', id: 2, confirmed_at: Time.now)
  end

  it 'correct names shows up in index' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'testname'
    expect(page).to have_content 'testname2'
  end

  it 'number of posts visible' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts:'
  end

  it 'profile images show up' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_css('img')
  end

  it 'user redirects correctly to page' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'User:testname'
  end
end
