module Api
  module V1
    module Admin
      class CategoriesController < ApplicationController
        def index
          response_operation(operation)
        end

        def create
          response_operation(operation, :created)
        end

        def update
          response_operation(operation)
        end

        def show
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
              Category::Operation::Index.()
            when 'create'
              Category::Operation::Create.(params: params)
            when 'update'
              Category::Operation::Update.(params: params)
            when 'show'
              Category::Operation::Show.(params: params)
            when 'destroy'
              Category::Operation::Destroy.(params: params)
            end
        end
      end
    end
  end
end
