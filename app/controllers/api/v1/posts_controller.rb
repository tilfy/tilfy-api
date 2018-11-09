module Api
  module V1
    class PostsController < ApplicationController

      def index
        response_operation(operation)
      end

      def create
        response_operation(operation, :created)
      end

      def show
        response_operation(operation)
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
            Post::Operation::Index.()
          when 'create'
            Post::Operation::Create.(params: params)
          when 'show'
            Post::Operation::Show.(params: params)
          when 'update'
            Post::Operation::Update.(params: params)
          when 'destroy'
            Post::Operation::Destroy.(params: params)
          end
      end
    end
  end
end