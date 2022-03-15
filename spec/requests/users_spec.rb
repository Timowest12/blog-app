# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET /index' do
#     subject { User.new(name: 'marc', photo: 'marc.png', bio: 'bio', posts_counter: 0) }
#     before { subject.save }

#     before(:each) { get users_path }

#     it 'index body returns http success' do
#       expect(response).to have_http_status(:success)
#     end

#     it 'Check the name is not blank' do
#       subject.name = nil
#       expect(subject).to_not be_valid
#     end

#     it 'check if the posts_counter numeric' do
#       subject.posts_counter = ''
#       expect(subject).to_not be_valid
#     end

#     it 'check if the posts_counter greater than or equal to zero' do
#       expect(subject.posts_counter).to be >= 0
#     end
#   end
#   describe 'GET /show' do
#     before(:each) { get '/users/show' }
#   end
# end
