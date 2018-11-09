require 'swagger_helper'

describe 'Posts Api', swagger_doc: 'v1/user/swagger.json' do
  path '/api/v1/posts' do
    get 'All posts' do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'

      response '200', 'Collection of posts' do
        run_test!
      end
    end

    post 'Create post' do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              title: { type: :string },
              content: { type: :string },
              category_id: { type: :string },
              user_id: { type: :string }
            },
            required: ['title', 'content', 'category_id', 'user_id']
          }
        }
      }

      response '201', 'Post created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    get 'Show post' do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '200', 'Show post' do
        run_test!
      end

      response '404', 'Post no found' do
        run_test!
      end
    end

    put 'Update post' do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              title: { type: :string },
              content: { type: :string }
            },
            required: ['title', 'content']
          }
        }
      }

      response '201', 'Post created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end

      response '404', 'Post no found' do
        run_test!
      end
    end

    delete 'Delete post' do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '204', 'Post deleted' do
        run_test!
      end

      response '404', 'Post no found' do
        run_test!
      end
    end

  end
end