class Post::Operation::Index < Application::Operation::Base
  step :model!

  def model!(options, **)
    options[:model] = Post.all.reverse_order
  end

end