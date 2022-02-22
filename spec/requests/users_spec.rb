require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) { get users_path }

    it 'index body returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'index page includes correct placeholder text' do
      expect(response.body).to include('this is the main users page')
    end
  end
  describe 'GET /show' do
    before(:each) { get '/users/show' }
    it 'show page loads succesfully' do
      expect(response).to have_http_status(:success)
    end

    it 'user template includes correct placeholder' do
      expect(response.body).to include('this is the users profile page')
    end
  end

end