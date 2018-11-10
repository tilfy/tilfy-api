require 'swagger_helper'

describe 'Replies Api', swagger_doc: 'v1/user/swagger.json' do
  path '/api/v1/comments/{comment_id}/replies' do
    get 'Replies from a comment' do
      tags 'Replies'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :comment_id, in: :path, type: :string

      response '200', 'Collection from replies from a comment' do
        run_test!
      end

      response '404', 'Comment no found' do
        run_test!
      end
    end

    post 'Create reply for a comment' do
      tags 'Replies'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :comment_id, in: :path, type: :string
      parameter name: :reply, in: :body, schema: {
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

      response '201', 'Reply created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end

      response '404', 'Comment no found' do
        run_test!
      end
    end
  end

  path '/api/v1/replies/{id}' do
    put 'Update reply' do
      tags 'Replies'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :reply, in: :body, schema: {
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

      response '200', 'Reply updated' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end

      response '404', 'Reply no found' do
        run_test!
      end
    end

    delete 'Delete reply' do
      tags 'Replies'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '204', 'Reply deleted' do
        run_test!
      end

      response '404', 'Reply no found' do
        run_test!
      end

    end
  end
end