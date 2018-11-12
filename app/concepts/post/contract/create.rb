class Post::Contract::Create < Application::Contract::Base
  property :title
  property :content
  property :user_id
  property :category_id

  validation with: { form: true } do
    configure { config.messages = :i18n }

    configure do
      def user_exists?(user_id)
        User.where(id: user_id).exists?
      end

      def category_exists?(category_id)
        Category.where(id: category_id).exists?
      end
      
    end
    required(:title).filled
    required(:content).filled
    required(:user_id).filled(:user_exists?)
    required(:category_id).filled(:category_exists?)
  end
end