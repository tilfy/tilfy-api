require 'swagger_helper'

describe 'User Likes Api', swagger_doc: 'v1/user/swagger.json' do
  path '/api/v1/posts/{post_id}/likes' do
    get 'Likes from a post' do
      tags 'User likes'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :post_id, in: :path, type: :string

      response '200', 'Collection from likes from a post' do
        run_test!
      end

      response '404', 'Post no found' do
        run_test!
      end
    end

    post 'Create like for a post' do
      tags 'User likes'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :post_id, in: :path, type: :string
      parameter name: :user_like, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              user_id: { type: :string }
            },
            required: ['user_id']
          }
        }
      }

      response '201', 'User like created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end

      response '404', 'Post no found' do
        run_test!
      end
    end
  end

  path '/api/v1/likes/{id}' do
    delete 'Delete User like' do
      tags 'User likes'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '204', 'User like deleted' do
        run_test!
      end

      response '404', 'User like no found' do
        run_test!
      end

    end
  end
end