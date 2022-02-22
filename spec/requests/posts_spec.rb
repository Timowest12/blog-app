require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) { get '/posts/:id/' }

    it 'index body returns http success' do
      expect(response).to have_http_status(:success)
    end

    
    it 'index page includes correct placeholder text' do
      expect(response.body).to include('this is the page for specific posts')
    end
  end

  describe 'GET /show' do
    before(:each) { get '/posts/show' }
    it 'show page loads succesfully' do
      expect(response).to have_http_status(:success)
    end

    it 'user template includes correct placeholder' do
      expect(response.body).to include('this is the page for specific posts')
    end
  end
end