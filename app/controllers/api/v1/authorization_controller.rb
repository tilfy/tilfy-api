module Api
  module V1
    class AuthorizationController < ApplicationController
      skip_before_action :authenticate_api_v1_user!, only: [:get_authorization]

      rescue_from(
        RestClient::BadRequest,
        with: :invalid_token_error
      )

      def get_authorization
        if operation.success?
          set_headers(operation[:token])

          render json: { message: 'Signed in successfully with google'}, status: :ok
        end
      end

      private

      def operation
        @operation ||= User::Operation::Create.(params: { id_token: params['id_token'] })
      end

      def set_headers token={}
        headers['access-token'] = token['access-token']
        headers['client'] = token['client']
        headers['expiry'] = token['expiry'].to_s
        headers['uid'] = token['uid']
        headers['token-type'] = token['token-type']
      end

      def invalid_token_error(exception)
        render(
          json: {
            errors: {
              message: 'Bad request, token invalid'
            }
          },
          status: :unprocessable_entity
        )
      end
    end
  end
end
