module Api
  module V1
    class CommentsController < ApplicationController

      def index
        response_operation(operation)
      end

      def create
        response_operation(operation, :created)
      end

      def update
        response_operation(operation)
      end

      def destroy
        response_operation(operation, :no_content)
      end

      private

      def operation
        @operation ||= 
          case action_name
          when 'index'
            Comment::Operation::Index.(params: params)
          when 'create'
            Comment::Operation::Create.(params: params)
          when 'update'
            Comment::Operation::Update.(params: params)
          when 'destroy'
            Comment::Operation::Destroy.(params: params)
          end
      end
    end
  end
end