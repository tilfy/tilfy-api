require 'swagger_helper'

describe 'Authorization Api', swagger_doc: 'v1/user/swagger.json' do
  path '/api/v1/auth/request' do
    post 'Authorization' do
      tags 'Auth'
      produces 'application/json'
      consumes 'application/json'
      security []

      parameter name: :authorization, in: :body, schema: {
        type: :object,
        properties: {
          id_token: { type: :string }
        },
        required: ['id_token']
      }

      response '200', 'Completed authorization' do
        run_test!
      end

      response '422', 'invalid token' do
        run_test!
      end
    end
  end
end
