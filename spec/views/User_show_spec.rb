require 'rails_helper'

describe "user index page tests", type: :feature do
  before :each do
    user1 = User.create(name: "testname", bio: "testbio", email: "user@example.com", password:"123456",id:1, confirmed_at: Time.now)
    user2 = User.create(name: "testname2", bio: "testbio2", email: "user2@example.com", password:"123456", confirmed_at: Time.now)
    post1 = Post.create(user_id: 1, title: 'post1', text: 'posttext1')
    post2 = Post.create(user_id: 1, title: 'post2', text: 'posttext2')
    post2 = Post.create(user_id: 1, title: 'post3', text: 'posttext3')
  end
it "button to show all exists" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'See all posts'
  end
  
it "last 3 posts show up" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'posttext1'
    expect(page).to have_content 'posttext2'
    expect(page).to have_content 'posttext3'
  end

it "User name shows up" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'User:testname'
  end

it "number of posts show up" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'Number of posts:'
  end

it "can see user bio" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'testbio'
  end

it "can see first 3 user posts" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1'
    expect(page).to have_content 'testbio'
  end
it "show all posts button redirects correctly" do
    visit '/users/sign_in'
    within("body") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts'
    expect(page).to have_content 'All post written by'
  end

end