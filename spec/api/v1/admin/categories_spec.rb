require 'rails_helper'

RSpec.describe 'Admin categories' do
  let!(:categories) { create_list(:category, 11) }
  let!(:category) { categories.first }
  let!(:valid_data) do
    {
      data: {
        name: 'Ruby'
      }
    }
  end
  let(:invalid_data) do
    { name: 'React' }
  end
  let(:data_existing) do
    {
      data: {
        name: categories.last.name
      }
    }
  end
  let(:id) { SecureRandom.uuid }
  let(:user) { create(:user) }
  let(:token) { user.create_new_auth_token }
  let(:headers) do
    {
      'access-token': token['access-token'],
      'client': token['client'],
      'expiry': token['expiry'].to_s,
      'uid': token['uid'],
      'token-type': token['token-type']
    }
  end

  describe 'collection from categories' do
    it 'list of categories' do
      get '/api/v1/admin/categories', headers: headers

      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(11)
    end
  end

  describe 'Create a category' do
    it 'post valid data to /api/v1/admin/categories' do
      post '/api/v1/admin/categories', params: valid_data, headers: headers

      expect(response).to have_http_status(201)
      expect(json['name']).to eq('Ruby')
    end

    it 'post invalid data to /api/v1/admin/categories' do
      post '/api/v1/admin/categories', params: invalid_data, headers: headers

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required')
    end

    it 'Post valid data with existing category to /api/v1/admin/categories' do
      post '/api/v1/admin/categories', params: data_existing, headers: headers

      expect(response).to have_http_status(422)
      expect(json['errors']['name'].first).to eq('It already exists')
    end
  end

  describe 'Show a category' do
    it 'get valid category' do
      get "/api/v1/admin/categories/#{category.id}", headers: headers

      expect(response).to have_http_status(200)
      expect(json['id']).to eq(category.id)
      expect(json['name']).to eq(category.name)
    end

    it 'invalid id of category' do
      get "/api/v1/admin/categories/#{id}", headers: headers

      expect(response).to have_http_status(404)
    end
  end

  describe 'Update a category' do
    it 'put category' do
      put "/api/v1/admin/categories/#{category.id}", params: valid_data, headers: headers

      expect(response).to have_http_status(200)
      expect(json['name']).to eq('Ruby')
    end

    it 'put invalid data' do
      put "/api/v1/admin/categories/#{category.id}", params: invalid_data, headers: headers

      expect(response).to have_http_status(422)
      expect(json['errors']['message']).to eq('params data is required')
    end

    it 'put existing data' do
      put "/api/v1/admin/categories/#{category.id}", params: data_existing, headers: headers

      expect(response).to have_http_status(422)
      expect(json['errors']['name'].first).to eq('It already exists')
    end

    it 'category no found' do
      put "/api/v1/admin/categories/#{id}", headers: headers

      expect(response).to have_http_status(404)
    end
  end

  describe 'Delete a category' do
    it 'destroy category' do
      delete "/api/v1/admin/categories/#{category.id}", headers: headers

      expect(response).to have_http_status(204)
    end

    it 'category no found' do
      delete "/api/v1/admin/categories/#{id}", headers: headers

      expect(response).to have_http_status(404)
    end
  end
end
