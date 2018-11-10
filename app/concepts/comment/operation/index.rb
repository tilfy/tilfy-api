class Comment::Operation::Index < BaseOperation
  step :model!

  def model!(options, params:, **)
    options[:model] = Post.find(params['post_id']).comments.reverse_order
  end
end