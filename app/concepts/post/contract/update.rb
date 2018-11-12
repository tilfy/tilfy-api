class Post::Contract::Update < Application::Contract::Base
  property :title
  property :content

  validation with: { form: true } do
    required(:title).filled
    required(:content).filled
  end
end