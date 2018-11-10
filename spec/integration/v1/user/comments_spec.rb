require 'swagger_helper'

describe 'Comments Api', swagger_doc: 'v1/user/swagger.json' do
  path '/api/v1/posts/{post_id}/comments' do
    get 'Comments from a post' do
      tags 'Comments'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :post_id, in: :path, type: :string

      response '200', 'Collection from comments from a post' do
        run_test!
      end

      response '404', 'Post no found' do
        run_test!
      end
    end

    post 'Create comment for a post' do
      tags 'Comments'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :post_id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              content: { type: :string },
              user_id: { type: :string }
            },
            required: ['content', 'user_id']
          }
        }
      }

      response '201', 'Comment created' do
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

  path '/api/v1/comments/{id}' do
    put 'Update comment' do
      tags 'Comments'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              content: { type: :string }
            },
            required: ['content']
          }
        }
      }

      response '200', 'Comment updated' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end

      response '404', 'Comment no found' do
        run_test!
      end
    end

    delete 'Delete comment' do
      tags 'Comments'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '204', 'Comment deleted' do
        run_test!
      end

      response '404', 'Comment no found' do
        run_test!
      end

    end
  end
end