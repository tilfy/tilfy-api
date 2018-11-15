require 'rails_helper'

RSpec.describe 'User replies' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:user_post) { create(:post, user: user, category: category) }
  let(:comment) { create(:comment, user: user, post: user_post)}
  let!(:replies) { create_list(:reply, 11, comment: comment, user: user) }
  let!(:reply) { replies.first }
  let(:comment_id) { SecureRandom.uuid }
  let(:valid_data) do
    {
      data: {
        content: 'Test reply content',
        user_id: user.id
      }
    }
  end
  let(:invalid_user) do
    {
      data: {
        content: 'Test reply content',
        user_id: SecureRandom.uuid
      }
    }
  end
  let(:invalid_data) do
    { content: 'Test reply content' }
  end
  let(:update_valid_data) do
    {
      data: { content: 'Test update reply' }
    }
  end
  let(:id) { SecureRandom.uuid }

  describe 'Collection of replies from a comment' do
    it 'get replies' do
      get "/api/v1/comments/#{comment.id}/replies"

      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(11)
    end

    it 'comment no found' do
      get "/api/v1/comments/#{comment_id}/replies"
      expect(response).to have_http_status(404)
    end
  end

  describe 'Create a reply for comment' do
    it 'post valid data' do
      post "/api/v1/comments/#{comment.id}/replies", params: valid_data

      expect(response).to have_http_status(201)
      expect(json['user_id']).to eq(user.id)
      expect(json['comment_id']).to eq(comment.id)
      expect(json['content']).to eq('Test reply content')
    end

    it 'post data with invalid user' do
      post "/api/v1/comments/#{comment.id}/replies", params: invalid_user

      expect(response).to have_http_status(422)
      expect(json['errors']['user_id'].first).to eq('Must exist')
    end

    it 'post invalid data' do
      post "/api/v1/comments/#{comment.id}/replies", params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required')
    end

    it 'comment no found' do
      post "/api/v1/comments/#{comment_id}/replies", params: valid_data

      expect(response).to have_http_status(404)
    end
  end

  describe 'Update reply' do
    it 'update reply with valid data' do
      put "/api/v1/replies/#{reply.id}", params: update_valid_data

      expect(response).to have_http_status(200)
      expect(json['content']).to eq('Test update reply')
    end

    it 'put invalid data' do
      put "/api/v1/replies/#{reply.id}", params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required')
    end

    it 'reply no found' do
      put "/api/v1/replies/#{id}", params: valid_data

      expect(response).to have_http_status(404)
    end
  end

  describe 'Destroy reply from a comment' do
    it 'delete reply' do
      delete "/api/v1/replies/#{reply.id}"

      expect(response).to have_http_status(204)
    end

    it 'reply no found' do
      delete "/api/v1/replies/#{id}"

      expect(response).to have_http_status(404)
    end
  end
  
end