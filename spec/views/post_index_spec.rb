require 'rails_helper'

describe 'user index page tests', type: :feature do
  before :each do
    @user1 = User.create(name: 'testname', bio: 'testbio', email: 'user@example.com', password: '123456', id: 1, confirmed_at: Time.now)
    @user2 = User.create(name: 'testname2', bio: 'testbio2', email: 'user2@example.com', password: '123456', confirmed_at: Time.now)
    @post1 = Post.create(user_id: 1, title: 'post1', text: 'posttext1', id: 1)
    @post2 = Post.create(user_id: 1, title: 'post2', text: 'posttext2')
    @post2 = Post.create(user_id: 1, title: 'post3', text: 'posttext3')
    @comment1 = Comment.create(post: Post.first, user_id: 1, text: 'Hi Tom, this is the first comment!', post_id: 1)
  end

  it 'profile image show up' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'
    expect(page).to have_css('img')
  end

  it 'username visible' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'testname'
  end

  it 'number of posts visible' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'Number of posts: 3'
  end

  it 'see number of comments' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'Comments:'
  end

  it 'see number of comments' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'Likes:'
  end

  it 'see number of comments' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'posttext1'
  end

  it 'see commentor username' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'Tom'
  end

  it 'see commentor username' do
    visit '/users/sign_in'
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit '/users/1/posts/1'

    expect(page).to have_content 'this is the first comment!'
  end
end
