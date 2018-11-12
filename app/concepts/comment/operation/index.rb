class Comment::Operation::Index < Application::Operation::Base
  step :model!

  def model!(options, params:, **)
    options[:model] = Post.find(params['post_id']).comments.reverse_order
  end
end