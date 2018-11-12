class Comment::Contract::Update < Application::Contract::Base
  property :content

  validation do
    required(:content).filled
  end
end