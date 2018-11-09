class Post::Operation::Index < BaseOperation
  step :model!

  def model!(options, **)
    options[:model] = Post.all.reverse_order
  end

end