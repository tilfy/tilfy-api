module Api
  module V1
    class ApplicationController < ActionController::API

      rescue_from(
        ActiveRecord::RecordNotFound, 
        with: :record_no_found_error
      )

      rescue_from(
        NoMethodError,
        with: :params_data_error
      )

      protected

      def response_operation(operation=nil, status=:ok)
        if operation.success?
          render(
            json: operation[:model],
            status: status
          )
        else
          error_operation(operation)
        end
      end

      def error_operation(operation)
        if operation['contract.default'].present?
          render(
            json: { 
              errors: operation['contract.default'].errors.messages 
            },
            status: :unprocessable_entity
          )
        else

        end
      end

      def record_no_found_error(exception)
        render(
          json: { 
            errors: {
              message: exception.message
            }
          },
          status: :not_found
        )
      end

      def params_data_error(exception)
        render(
          json: {
            errors: {
              message: 'params data is required'
            }
          },
          status: :unprocessable_entity
        )
      end

    end
  end
end