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
            json: operation['contract.default'].errors.full_messages,
            status: :unprocessable_entity
          )
        else

        end
      end

      def record_no_found_error(exception)
        render(
          json: { message: exception.message },
          status: 404
        )
      end

      def params_data_error(exception)
        render(
          json: { message: 'params data is required' },
          status: 422
        )
      end

    end
  end
end