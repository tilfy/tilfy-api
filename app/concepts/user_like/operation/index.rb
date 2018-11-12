class UserLike::Operation::Index < Application::Operation::Base
  step :model!

  def model!(options, params:, **)
    options[:model] = Post.find(params['post_id']).user_likes.reverse_order
  end
end