require 'rails_helper'

RSpec.describe 'User comments' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:user_post) { create(:post, user: user, category: category) }
  let!(:comments) { create_list(:comment, 11, user: user, post: user_post) }
  let(:comment) { comments.first }
  let(:valid_data) do
    {
      data: {
        content: 'Test comment content',
        user_id: user.id
      }
    }
  end
  let(:invalid_user) do
    {
      data: {
        content: 'Test comment content',
        user_id: SecureRandom.uuid
      }
    }
  end
  let(:invalid_data) do
    { content: 'Test comment content' }
  end
  let(:post_id) { SecureRandom.uuid }
  let(:update_valid_data) do
    {
      data: { content: 'Test update comment' }
    }
  end
  let(:id) { SecureRandom.uuid }
  

  describe 'Collection of comments from a post' do
    it 'get comments' do
      get "/api/v1/posts/#{user_post.id}/comments"

      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(11)
    end

    it 'post no found' do
      get "/api/v1/posts/#{post_id}/comments"

      expect(response).to have_http_status(404)
    end
  end

  describe 'Create a comment for post' do
    it 'post valid data' do
      post "/api/v1/posts/#{user_post.id}/comments", params: valid_data

      expect(response).to have_http_status(201)
      expect(json['user_id']).to eq(user.id)
      expect(json['post_id']).to eq(user_post.id)
      expect(json['content']).to eq('Test comment content')
    end

    it 'post data with invalid user' do
      post "/api/v1/posts/#{user_post.id}/comments", params: invalid_user

      expect(response).to have_http_status(422)
      expect(json['errors']['user_id'].first).to eq('Must exist')
    end

    it 'post invalid data' do
      post "/api/v1/posts/#{user_post.id}/comments", params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required')
    end

    it 'post no found' do
      post "/api/v1/posts/#{post_id}/comments", params: valid_data

      expect(response).to have_http_status(404)
    end
  end

  describe 'Update comment' do
    it 'update comment with valid data' do
      put "/api/v1/comments/#{comment.id}", params: update_valid_data

      expect(response).to have_http_status(200)
      expect(json['content']).to eq('Test update comment')
    end

    it 'put invalid data' do
      put "/api/v1/comments/#{comment.id}", params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required')
    end

    it 'comment no found' do
      put "/api/v1/comments/#{id}", params: valid_data

      expect(response).to have_http_status(404)
    end
  end

  describe 'Destroy comment from a post' do
    it 'delete comment' do
      delete "/api/v1/comments/#{comment.id}"

      expect(response).to have_http_status(204)
    end

    it 'comment no found' do
      delete "/api/v1/comments/#{id}"

      expect(response).to have_http_status(404)
    end
  end
  
  
end