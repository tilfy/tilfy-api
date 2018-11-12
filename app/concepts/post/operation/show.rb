class Post::Operation::Show < Application::Operation::Base
  step Model(Post, :find)
end