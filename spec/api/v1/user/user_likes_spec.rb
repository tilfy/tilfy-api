require 'rails_helper'

RSpec.describe 'User User likes' do
  let!(:category) { create(:category) }
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user, category: category) }
  let!(:user_likes) { create_list(:user_like, 11, post: posts.first, user: user) }
  let(:user_like) { user_likes.first }
  let(:valid_data) do
    {
      data: {
        user_id: user.id
      }
    }
  end
  let(:invalid_data) do
    {
      user_id: user.id
    }
  end
  let(:invalid_user) do
    {
      data: {
        user_id: SecureRandom.uuid
      }
    }
  end
  let(:id) { SecureRandom.uuid }


  describe 'Get all user like from a post' do
    it 'collection of user likes' do
      get "/api/v1/posts/#{posts.first.id}/likes"

      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(11)
    end

    it 'post no found' do
      get "/api/v1/posts/#{id}/likes"

      expect(response).to have_http_status(404)
    end
  end

  describe 'Create a like for a post' do
    it 'post valid data' do
      post "/api/v1/posts/#{posts.last.id}/likes", params: valid_data

      expect(response).to have_http_status(201)  
    end

    it 'post invalid data' do
      post "/api/v1/posts/#{posts.last.id}/likes", params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required') 
    end

    it 'post invalid user' do
      post "/api/v1/posts/#{posts.last.id}/likes", params: invalid_user

      expect(response).to have_http_status(422)
      expect(json['errors']['user_id'].first).to eq('Must exist')
    end

    it 'post no found' do
      post "/api/v1/posts/#{id}/likes", params: valid_data

      expect(response).to have_http_status(404)
    end
  end
  
  describe 'delete like' do
    it 'delete user like' do
      delete "/api/v1/likes/#{user_like.id}"

      expect(response).to have_http_status(204)
    end

    it 'user like no found' do
      delete "/api/v1/likes/#{id}"

      expect(response).to have_http_status(404)
    end
  end
end