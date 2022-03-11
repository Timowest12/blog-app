require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    subject { Post.new(title: 'New post', text: 'Hi there', user_id: 2) }
    before { subject.save }

    it 'check if the title is not empty' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'check if the title is not exceeding 250 characters' do
      subject.title = 'testtestesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttestt'
      expect(subject).to_not be_valid
    end
  end 
end
