class Post::Operation::Show < Application::Operation::Base
  step :model!

  def model!(options, params:, **)
    options[:model] = Post.find(params['id'])
  end
end