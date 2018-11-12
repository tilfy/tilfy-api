require 'rails_helper'

RSpec.describe 'User posts' do
  let!(:category) { create(:category) }
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 11, user: user, category: category) }
  let(:valid_data) do
    {
      data: {
        title: 'Test title',
        content: 'Test content',
        user_id: user.id,
        category_id: category.id
      }
    }
  end
  let(:invalid_user_category) do
    {
      data: {
        title: 'Test title',
        content: 'Test content',
        user_id: SecureRandom.uuid,
        category_id: SecureRandom.uuid
      }
    }
  end
  let(:invalid_data) do
    {
      title: 'Test title',
      content: 'Test content'
    }
  end
  let(:id) { SecureRandom.uuid }
  let(:update_data) do
    {
      data: {
        title: 'Test update title',
        content: 'Test update content'
      }
    }
  end

  describe 'collection from posts' do
    it 'list of posts' do
      get '/api/v1/posts'

      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(11)
    end
  end

  describe 'Create a post' do
    it 'post valid data' do
      post '/api/v1/posts', params: valid_data

      expect(response).to have_http_status(201)
      expect(json['title']).to eq('Test title')
      expect(json['content']).to eq('Test content')
      expect(json['user_id']).to eq(user.id)
      expect(json['category_id']).to eq(category.id)  
    end

    it 'Post with Invalid category id and user id' do
      post '/api/v1/posts', params: invalid_user_category

      expect(response).to have_http_status(422)
      expect(json[0]).to eq('User Id No found')  
      expect(json[1]).to eq('Category Id No found')
    end

    it 'Post with invalid data' do
      post '/api/v1/posts', params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['message']).to eq('params data is required')  
    end
  end

  describe 'Show post' do
    it 'find post' do
      get "/api/v1/posts/#{posts.first.id}"

      expect(response).to have_http_status(200)
      expect(json['title']).to eq(posts.first.title)
      expect(json['content']).to eq(posts.first.content)  
    end

    it 'post no found' do
      get "/api/v1/posts/#{id}"

      expect(response).to have_http_status(404)      
    end
  end

  describe 'Update post' do
    it 'put valid data' do
      put "/api/v1/posts/#{posts.first.id}", params: update_data

      expect(response).to have_http_status(200)
      expect(json['title']).to eq('Test update title')
      expect(json['content']).to eq('Test update content')
    end

    it 'put invalid data' do
      put "/api/v1/posts/#{posts.first.id}", params: invalid_data

      expect(response).to have_http_status(422)
      expect(json['message']).to eq('params data is required')
    end

    it 'post no found' do
      put "/api/v1/posts/#{id}", params: valid_data

      expect(response).to have_http_status(404)      
    end
  end

  describe 'delete post' do
    it 'delete a post' do
      delete "/api/v1/posts/#{posts.first.id}"

      expect(response).to have_http_status(204)
    end

    it 'post no found' do
      delete "/api/v1/posts/#{id}"
      
      expect(response).to have_http_status(404)      
    end
  end
end