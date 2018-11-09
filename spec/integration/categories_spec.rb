require 'swagger_helper'

describe 'Categories API' do
  path '/api/v1/categories' do
    get 'All categories' do
      tags 'Categories'
      produces 'application/json'
      consumes 'application/json'

      response '200', 'Collection of categories' do
        run_test!
      end
    end

    post 'Create category' do
      tags 'Categories'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              name: { type: :string }
            },
            required: ['name']
          }
        }
      }

      response '201', 'Category Created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/categories/{id}' do
    get 'Show category' do
      tags 'Categories'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '200', 'Show category' do
        run_test!
      end

      response '404', 'Category no found' do
        run_test!
      end
    end

    put 'Update category' do
      tags 'Categories'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            properties: {
              name: { type: :string }
            },
            required: ['name']
          }
        }
      }

      response '200', 'Category updated' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end

      response '404', 'Category no found' do
        run_test!
      end
    end

    delete 'Delete category' do
      tags 'Categories'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string

      response '204', 'Category deleted' do
        run_test!
      end

      response '404', 'Category no found' do
        run_test!
      end
    end
  end
end