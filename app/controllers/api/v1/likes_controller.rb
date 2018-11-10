module Api
  module V1
    class LikesController < ApplicationController
      def index
        response_operation(operation)
      end

      def create
        response_operation(operation, :created)
      end

      def destroy
        response_operation(operation, :no_content)
      end

      private

      def operation
        @operation ||= 
          case action_name
          when 'index'
            UserLike::Operation::Index.(params: params)
          when 'create'
            UserLike::Operation::Create.(params: params)
          when 'destroy'
            UserLike::Operation::Destroy.(params: params)
          end
      end
    end
  end
end